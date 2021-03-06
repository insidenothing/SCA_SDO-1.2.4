<?php
/*
+-----------------------------------------------------------------------------+
| (c) Copyright IBM Corporation 2006, 2007.                                   |
| All Rights Reserved.                                                        |
+-----------------------------------------------------------------------------+
| Licensed under the Apache License, Version 2.0 (the "License"); you may not |
| use this file except in compliance with the License. You may obtain a copy  |
| of the License at -                                                         |
|                                                                             |
|                   http://www.apache.org/licenses/LICENSE-2.0                |
|                                                                             |
| Unless required by applicable law or agreed to in writing, software         |
| distributed under the License is distributed on an "AS IS" BASIS, WITHOUT   |
| WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.            |
| See the License for the specific language governing  permissions and        |
| limitations under the License.                                              |
+-----------------------------------------------------------------------------+
| Author: Graham Charters,                                                    |
|         Matthew Peters,                                                     |
|         Megan Beynon,                                                       |
|         Chris Miller,                                                       |
|         Caroline Maynard,                                                   |
|         Simon Laws                                                          |
+-----------------------------------------------------------------------------+
$Id: SCA_CommentReader.php,v 1.7 2008/03/03 17:56:36 mfp Exp $
*/

require "SCA/SCA_AnnotationRules.php";
require "SCA/SCA_ReferenceType.php";

if ( ! class_exists('SCA_CommentReader', false) ) {
    class SCA_CommentReader {

        const   EOL                     = "\n" ;
        
        // Clashed with 5.3 namespace support.  Does not appear to be used
        // TODO: clean up unused constants
        //const   NAMESPACE               = "@namespace" ;
        
        const   STRETCHEDNS             = "@namespace " ;

        const   BINDING                 = 'binding' ;
        const   SERVICE                 = 'service' ;

        const   PARAM_ANNOTATION        = 'parameters' ;
        const   RETRN_ANNOTATION        = 'return' ;
        const   NAME_ANNOTATION         = 'name' ;

        private $docComment             = null ;
        private $Rule                   = null ;

        private $xsd_types_array           = null ;
        private $returnValues           = null ;

        private $methodAnnotations      = null ;
        private $annotation             = null ;

        private $reason                 = null ; // In event of an exception

        /**
         * Pulls out name value pairs from the doc comment
         *
         */
        public function getNameValuePairs() {
            $lines = explode("\n", $this->docComment);

            $binding_config = array();

            foreach ($lines as $line) {
                $words = explode(" ", $line);
                for ($i=0; $i<count($words); $i++) {
                    if (($pos = strpos($words[$i], '@') !== false)
                    && isset($words[$i+1])) {
                        // If it's come from an annotation we need to get rid of the
                        // newlines.
                        /*
                        $temp  = str_replace("\r", "", substr($words[$i], 1, strlen($words[$i])-1));
                        $name  = str_replace("\n", "", $temp);
                        $temp  = str_replace("\r", "", $words[$i+1]);
                        $value = str_replace("\n", "", $temp);
                        $binding_config[$name] = $value;
                        */
                        $binding_config[trim(substr($words[$i], 1,
                        strlen($words[$i])-1))] = trim($words[$i+1]);
                    }
                }
            }
            return $binding_config;
        }

        /**
         * Get the interface name following an @service annotation.
         * 
         * @return string The service interface name or null if one isn't specified.
         *
         */
        public function getServiceInterface() {
            $config = $this->getNameValuePairs();
            if (array_key_exists('service', $config))
                return $config['service'];
        }
        
        public function __construct($comment)
        {

            $this->docComment    = $comment;
            $this->Rule          = new SCA_AnnotationRules();

        }/* End constructor method                                                 */

        /**
         * Build a two-dimensional array containing the contents of the method 
         * annotations discovered in the document comment.
         * The format of the returned array is compatible with the generate 
         * wsdl function
         *      array( 'parameters' => $parameter_descriptions
         *         , 'return'     => $return_descriptor
         *         );
         *
         *
         * @return array ( 2dim array containing parameter lines or null )
         * @throws SCA_RuntimeException when an error in the parameter annotation
         */
        public function getMethodAnnotations()
        {
            $i                       = 0 ;
            $this->reason            = null ;
            $this->annotation        = array() ;
            $this->methodAnnotations = SCA_AnnotationRules::createEmptyAnnotationArray();

            $line = strtok($this->docComment, self::EOL); /* 1st line              */

            /* Loop round until all the doc comment has been read                  */
            while ( $line !== false ) {
                /* Is this a 'parameter' line                                      */
                if ( $this->Rule->isMethodAnnotation($line) ) {

                    /* Extract the components of the annotation into an array      */
                    $words = SCA_AnnotationRules::parseAnnotation($line);

                    if ( SCA_AnnotationRules::enoughPieces($words) === true ) {
                        if ( strcmp($words[ 0 ], SCA_AnnotationRules::PARAM) === 0 ) {
                            $this->methodAnnotations[ self::PARAM_ANNOTATION ][$i++] =
                            $this->setParameterValues($words);
                        } else if ( strcmp($words[ 0 ], SCA_AnnotationRules::NAME) === 0 ) {
                            $this->methodAnnotations[ self::NAME_ANNOTATION ] =
                            $this->setMethodAlias($words);
                        } else {
                            /* Ensure that no syntax error has been detected       */
                            if ( ($checkValue = $this->setReturnValues($words)) != null ) {
                                $this->methodAnnotations[ self::RETRN_ANNOTATION ][ 0 ] =
                                $checkValue;
                            } else {
                                $reason = "Invalid return annotation syntax in '{$line}' " ;
                                throw new SCA_RuntimeException($reason);
                            }/* End syntax check                                   */

                        }/* End parameter or return annotations                    */

                    } else {
                        $reason = "Invalid method annotation syntax in '{$line}' " ;
                        throw new SCA_RuntimeException($reason);
                    }/* End not enough pieces                                      */

                }/* End no method annotatons in this line                          */

                $line = strtok(self::EOL); /* next line                            */

            }/* End all lines of the comment                                       */

            return $this->methodAnnotations ;

        }/* End get the method annotations function                                */

        /**
        * Build a two-dimensional array containing the contents of the parameter annotations
        * The format of the paramater annotations differs depending on whether simple type or SDO. e.g.
        *  - @param string $name (comment)
        * or
        *  - @param objectname namespaceprefix nameType (comment)
        *
        * @param  array  of raw words
        * @return array  containing parameter values for the wsdl
        */
        public function setParameterValues( $words )
        {
            $paramValue                   = array() ;
            $paramValue['annotationType'] = $words[ 0 ] ;

            if (!isset($words[1])) {
                throw new SCA_RuntimeException('@param must be followed by a type');
            }

            if (!isset($words[2])) {
                throw new SCA_RuntimeException('@param must be followed by a type then a variable name');
            }

            $type                         = $words[ 1 ] ;
            $param_name                   = $words[ 2 ] ;

            if (strncmp($param_name,'$',1) !== 0) {
                throw new SCA_RuntimeException('The variable name in an @param annotation must begin with a $');
            }

            $paramValue['nillable'] = false;
            $pos_pipe = strpos($type,'|');
            if ($pos_pipe !== false) {
                $after_pipe = substr($type,$pos_pipe+1);
                $type = substr($type,0,$pos_pipe);
                if ($after_pipe == 'null') {
                    $paramValue['nillable'] = true;
                } else {
                    throw new SCA_RuntimeException('@param with a type containing the pipe symbol may only have null as the second type');
                }
            }

            /* When the type is an object the format of the line is different      */
            if ( $this->Rule->isSupportedPrimitiveType($type) === false ) {
                $paramValue[ 'type' ]          = 'object' ;
                $paramValue[ 'name' ]          = $param_name ;

                if (!isset($words[3])) {
                    throw new SCA_RuntimeException('@param with a data type must contain a namespace');
                }


                $paramValue[ 'namespace' ]     = $words[3] ;
                $paramValue[ 'objectType' ]    = $type ;
                if ( (count($words)) > 4 )
                $paramValue[ 'description' ] = $words[4] ;

            } else {
                $paramValue[ 'type' ]          = $type ;
                $paramValue[ 'name' ]          = $param_name ;
                if ( (count($words)) > 3 )
                $paramValue[ 'description' ] = $words[ 3 ] ;

            }/* End place into the wsdl definitions                                */

            return $paramValue ;

        }/* End setParameterValues function                                        */

        /**
        * Build an array containing the contents of return annotation lines.
        * The format of the return annotation differs depending on whether simple type or SDO. e.g.
        *  - @return type (comment)
        * or
        * - -@return objectname nameType (comment)
        *
        * @param  array   Containing the raaw words
        * @return array   for the WSDL
        */
        public function setReturnValues( $words )
        {
            $returnValue                   = array() ;
            $returnValue['annotationType'] = $words[ 0 ] ;

            if (!isset($words[1])) {
                throw new SCA_RuntimeException('@return must be followed by a type');
            }
            $type                          = $words[ 1 ] ;

            $returnValue['nillable'] = false;
            $pos_pipe = strpos($type,'|');
            if ($pos_pipe !== false) {
                $after_pipe = substr($type,$pos_pipe+1);
                $type = substr($type,0,$pos_pipe);
                if ($after_pipe == 'null') {
                    $returnValue['nillable'] = true;
                } else {
                    throw new SCA_RuntimeException('@return with a type containing the pipe symbol may only have null as the second type');
                }
            }

            /* When the type is an object the format of the line is different      */
            if ( $this->Rule->isSupportedPrimitiveType($type) === false ) {
                /**
                 * Make sure that the return annotation although appearing as if
                 * it is an object has enough elements to make the wsdl definition
                 */
                if ( count($words) > 2 ) {
                    $returnValue[ 'type' ]          = 'object' ;
                    $returnValue[ 'namespace' ]     = $words[ 2 ] ;
                    $returnValue[ 'objectType' ]     = $type ;
                    if ( (count($words)) > 3 )
                    $returnValue[ 'description' ] = $words[ 3 ] ;
                } else {
                    $returnValue =  null ; // error return!
                }

            } else {
                $returnValue[ 'type' ]          = $type ;
                if ( (count($words)) > 2 )
                $returnValue[ 'description' ] = $words[ 2 ] ;


            }/* End place into the wsdl definitions                                   */

            return  $returnValue ;

        }/* End set return annotation values function                               */

        /**
        * Return method alias specified using @name
        *
        * @param  array   Containing the raw words
        * @return array   Method alias (Currently used only for XMLRPC)
        */
        public function setMethodAlias( $words )
        {
            $alias                   = array() ;
            $alias['annotationType'] = $words[ 0 ] ;

            if (!isset($words[1])) {
                throw new SCA_RuntimeException('@name must be followed by a name');
            }

            $alias[ 'name' ]          = $words[ 1 ] ;


            return  $alias ;

        }/* End set alias annotation values function                               */

        /**
        * Extract the XML Schema Definition from the script comment
        *
        * @return array  Containing the xsd types or null
        */
        public function getXsdTypes()
        {
            $this->xsd_types_array = array();
            $line = strtok($this->docComment, "\n");
            while ($line !== false) {
                if (strpos($line, "@types") !== false) {
                    $words = SCA_AnnotationRules::parseAnnotation($line);

                    if (!isset($words[2])) {
                        throw new SCA_RuntimeException('types annotation needs a namespace and schema location');
                    }

                    $namespace = $words[1];
                    $filename  = $words[2];
                    $filename  = trim($filename); // get rid of any \r
                    $path_info = pathinfo($filename);

                    if ($path_info['extension'] == 'xsd') {
                        array_push($this->xsd_types_array, array($namespace, $filename));
                    }
                }
                $line = strtok("\n");  //next line
            }
            return $this->xsd_types_array;
        }

        public function isService()
        {
            return $this->_hasAnnotation('service');
        }

        // Return the binding annotation in the comment starting from the specified start position
        // Update the start position so that the next binding can be retrieved using this method
        // when scanning bindings for services.
        //
        // Return only valid bindings which are identified by the subdirectories under SCA/Bindings
        //
        private function getBinding($ignoreLocal=false, &$pos = 0) {

            $binding = null;

            // Find the next binding annotation @binding.<binding>
            $bindingAnnotation = "@" . self::BINDING . ".";
            $pos = strpos($this->docComment, $bindingAnnotation, $pos);
            if ($pos !== false) {

                $targetLine = substr($this->docComment, $pos);
                $pos = $pos + strlen($bindingAnnotation);

                $targetLine = ereg_replace("\t", " ", $targetLine);
                $words      = explode(" ", $targetLine);
                for ($i = 0; $i < count($words); $i++) {
                    $word = trim($words[$i++]);
                    if (strpos($word, $word, $bindingAnnotation) === 0) {
                        $binding = substr($word, strlen($bindingAnnotation));
                        break;
                    }
                }
            }

            // binding.php is local binding
            if ($binding == "php")
            $binding = $ignoreLocal? null: "local";

            // Check if this is a known binding - all known bindings have a Binding/<binding>
            // subdirectory under the directory containing SCA.php
            if ($binding != null) {

                foreach (get_included_files() as $file) {
                    if (basename($file, ".php") == "SCA") {
                        $scaDir     = dirname($file);
                        $bindingDir = realpath("$scaDir/Bindings/$binding");
                        break;
                    }
                }
                if (!isset($bindingDir)||$bindingDir === false)
                $binding = null;
            }

            return $binding;

        }

        // Find all valid bindings under following a service annotation
        public function getBindings() {

            $bindings = array();
            $pos = 0;
            $bindingAnnotation = "@" . self::BINDING . ".";
            while ($pos < strlen($this->docComment)) {
                $binding = $this->getBinding(true, $pos);
                if ($binding != null) {
                    $bindings[] = $binding;
                } else {
                    break;
                }
            }

            return $bindings;

        }


        public function isWebMethod()
        {
            // currently exposing all methods if the class is a web service
            // leave this test in place in case we want to change our mind
            return true;
        }

        public function isReference()
        {
            return $this->_hasAnnotation('reference');
        }
        public function hasBinding()
        {
            return $this->_hasAnnotation('binding');
        }

        public function isNamespace()
        {
            return $this->_hasAnnotation('namespace');
        }


        public function getReference()
        {
            if ($this->getBinding() != null) {
                return $this->_getSingleWordFollowing(self::BINDING);
            } else {
                throw new SCA_RuntimeException("Instance variable has @reference but has no valid @binding.*");
            }
        }

        public function getReferenceFull()
        {
            $reference_type = new SCA_ReferenceType();

            // get the binding info from the reference comment
            $binding = null;

            if (($bindingType = $this->getBinding()) != null) {
                $binding = $this->_getSingleWordFollowing(self::BINDING);
                $reference_type->setBindingType($bindingType);
            }else {
                throw new SCA_RuntimeException("An @reference was found with no following @binding, or an invalid @binding");
            }

            $reference_type->addBinding($binding);

            $reference_type->setBindingConfig($this->getNameValuePairs());

            // get any extra type info from the reference comment
            $types = $this->getXsdTypes();
            $reference_type->addTypes($types);

            return $reference_type;
        }

        public function getTemplate()
        {
            return $this->_getSingleWordFollowing("template");
        }

        public function getType()
        {
            return $this->_getSingleWordFollowing("type");
        }

        public function getIcon()
        {
            return $this->_getSingleWordFollowing("icon");
        }

        public function getFactory()
        {
            return $this->_getSingleWordFollowing("factory");
        }

        public function getParameter()
        {
            return $this->_getSingleWordFollowing("parameter");
        }

        public function getDescription()
        {
            return $this->_getEveryWordFollowing("description");
        }

        public function getDisplayName()
        {
            return $this->_getEveryWordFollowing("displayName");
        }

        public function getDefaults()
        {
            $max = $this->getMultiplicity();
            $pos = strripos($max, '..');

            if (substr($max, $pos+2)>1) {
                return $this->_getValuesFollowing("default");
            }

            return $this->_getEveryWordFollowing("default");

        }

        public function getChoices()
        {
            return $this->_getValuesFollowing("choices");
        }

        public function getExpert()
        {
            return $this->_getBooleanFollowing("expert");
        }

        public function getMultiplicity()
        {
            return $this->_getSingleWordFollowing("multiplicity");
        }

        public function getRegularExpression()
        {
            return $this->_getSingleWordFollowing("regex");
        }

        public function getValueProvider()
        {
            return $this->_getSingleWordFollowing("valueProvider");
        }

        public function getArguments()
        {
            return $this->_getArgumentsFor("argument");
        }

        /**
         * Return the reason ( if there is one ) for the exception
         *
         * @return string   'null' if there was no problem
         */
        public function because()
        {
            return $this->reason ;
        }/* End because function                                                   */


        /**
         * Extracts the word following a label. As the 'label' may be formatted with
         * extra spaces ( shown as a zero length string by explode() ) and tabs
         * make sure that these skipped until the first 'real' word is found.
         *
         * @param  string  $label
         * @return string
         */
        private function _getSingleWordFollowing($label)
        {

            $targetLine = strchr($this->docComment, "@" . $label);
            $targetLine = ereg_replace("\t", " ", $targetLine);
            $words      = explode(" ", $targetLine);
            $phoneme    = $words[ 1 ];

            if ( ($size = count($words)) >1 ) {
                /* Ensuring you step over the first word . . .                     */
                for ( $i = 1 ; $i < $size ; $i++  ) {
                    /* ... ditch all the 'spaces'                                  */
                    if ( strlen($words[ $i ]) !== 0  ) {
                        $phoneme = $words[ $i ] ; // and grab the 1st word you find
                        break ;
                    }
                }/*End all words in the label                                      */

                return trim($phoneme);

            }/* End there are enough words                                         */

            return null;
        }

        private function _hasAnnotation($label)
        {
            $pos = strpos($this->docComment, "@" . $label);
            return ( ($pos !== false) ? true : false ) ;
        }

        private function _getEveryWordFollowing($label)
        {
            $every=$this->_getValuesFollowing($label);

            if ($every==null) {
                return null;
            }

            return implode(" ", $every);
        }

        private function _getValuesFollowing($label)
        {
            $words = explode(" ", strchr($this->docComment, "@" . $label . " "));

            if (count($words)<=1) {
                return null;
            }

            $every=array();

            $i=1;
            $word=trim($words[$i]);
            while ($word!=="*" && ($i<count($words))) {
                $every[]=$word;
                $i++;
                $word=trim($words[$i]);
            }

            return $every;
        }

        private function _getArgumentsFor($label)
        {

            $label="@".$label;
            $words = explode(" ", strchr($this->docComment, $label . " "));

            if (count($words)<=1) {
                return null;
            }

            $every=array();

            $i=0;
            while ($i<count($words)) {
                $word=trim($words[$i]);
                if ($word==$label) {
                    $every[trim($words[$i+1])]=trim($words[$i+2]);
                    $i=$i+2;
                }
                $i++;
            }

            return $every;
        }

        private function _getBooleanFollowing($label)
        {
            $word = $this->_getSingleWordFollowing($label);
            return ($word=='true') ? true : false;
        }

    }/* End comment reader class                                                   */

}/* End instance test                                                              */
?>
