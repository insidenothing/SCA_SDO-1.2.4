<?php
/*
+-----------------------------------------------------------------------------+
| (c) Copyright IBM Corporation 2006, 2007                                    |
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
| Authors: Graham Charters, Matthew Peters                                    |
|                                                                             |
+-----------------------------------------------------------------------------+
$Id: customer_test.php,v 1.2 2007/02/08 16:36:47 mfp Exp $
*/

$xmldas = SDO_DAS_XML::create(dirname(__FILE__) . '/../Schema/Customer.xsd');
$doc    = $xmldas->createDocument('customerNS', 'customer');
$customer = $doc->getRootDataObject();

$customer->customerId = 1;
$customer->name = "Bernard Jones";

$shipping = $customer->createDataObject('shipping');
$shipping->street = "My Street";
$shipping->city = "My City";
$shipping->state = "Amess";
$shipping->zip = "XX21 3YZ";

$payment = $customer->createDataObject('payment');
$payment->accountNo = "1234 1234 1234 1234";
$payment->bank = "Bank of the Broke";
$payment->securityCode = "423";
$payment->amount = 100.0;

echo $xmldas->saveString($doc,2);

?>