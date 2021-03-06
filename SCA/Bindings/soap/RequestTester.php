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
$Id: RequestTester.php,v 1.1.2.2 2007/02/19 18:10:35 mfp Exp $
*/

if ( ! class_exists('SCA_Bindings_soap_RequestTester', false) ) {
	class SCA_Bindings_soap_RequestTester
	{
		public function isServiceDescriptionRequest($calling_component_filename)
		{
			SCA_Helper::checkSoapExtensionLoaded();

			if (isset($_SERVER['REQUEST_METHOD'])) {
				if ($_SERVER['REQUEST_METHOD'] == 'GET') {
					$p1 = realpath($calling_component_filename);
					$p2 = realpath($_SERVER['SCRIPT_FILENAME']);
					if ($p1 == $p2 && isset($_GET['wsdl'])) {
						return true;
					}
				}
			}

			return false;
		}

		public function isServiceRequest($calling_component_filename)
		{
			SCA_Helper::checkSoapExtensionLoaded();

			if (isset($_SERVER['HTTP_HOST'])) {
				if ($_SERVER['REQUEST_METHOD'] == 'POST') {
					if ((isset($_SERVER[ 'PATH_INFO' ])) && $_SERVER[ 'PATH_INFO' ] == '/RPC2') {
						return false; // looks like it is XmlRpc, not SOAP
					}
					$p1 = realpath($calling_component_filename);
					$p2 = realpath($_SERVER['SCRIPT_FILENAME']);
					if ($p1 == $p2 &&
					(strpos($_SERVER['CONTENT_TYPE'], 'text/xml') !== false || strpos($_SERVER['CONTENT_TYPE'], 'soap') !== false)){
						return true;
					}
				}
			}
			return false;
		}

	}
}
?>