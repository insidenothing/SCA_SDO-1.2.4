<?php
/*
+----------------------------------------------------------------------+
| Copyright IBM Corporation 2007.                                      |
| All Rights Reserved.                                                 |
+----------------------------------------------------------------------+
|                                                                      |
| Licensed under the Apache License, Version 2.0 (the "License"); you  |
| may not use this file except in compliance with the License. You may |
| obtain a copy of the License at                                      |
| http://www.apache.org/licenses/LICENSE-2.0                           |
|                                                                      |
| Unless required by applicable law or agreed to in writing, software  |
| distributed under the License is distributed on an "AS IS" BASIS,    |
| WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or      |
| implied. See the License for the specific language governing         |
| permissions and limitations under the License.                       |
+----------------------------------------------------------------------+
| Author: Graham Charters                                              |
+----------------------------------------------------------------------+
$Id: eBayConsumer.php,v 1.1.2.1 2007/06/12 08:32:49 gcc Exp $
*/

include 'SCA/SCA.php';


/**
 * Consumes eBay
 * @service
 *
 */
class eBayConsumer {

    /**
     * eBay service reference
     * 
     * @reference
     * @binding.ebaysoap eBaySvc.wsdl
     *
     * @config ./config/ebay.ini
     */
    public $ebay;

    public function GetSearchResults($query) {
        // Create the body
        $request = $this->ebay->createDataObject('urn:ebay:apis:eBLBaseComponents', 
                                                 'GetSearchResultsRequestType');
        $request->Version = 495;
        $request->Query = $query;
        $request->createDataObject('Pagination');
        $request->Pagination->EntriesPerPage = 10;
        
        return $this->ebay->GetSearchResults($request);
    }
}

?>