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
$Id: customer.php,v 1.2 2007/02/08 16:36:47 mfp Exp $
*/


function display_form($labels) {
    
    foreach ($labels as $value) {
        table_row_start();
        table_cell($value);
        table_cell("<input type=text name=\"$value\"/></br>");
        table_row_end();
    }
}

function display_customer($customer) {
    table_start();
    table_row_start();
    table_cell('<b>Name</b>', '#DDFFFF');
    table_cell(isset($customer->name) ? $customer->name : 'no name supplied');
    table_row_end();

    $address_labels = array('Street', 'City', 'State', 'Zip');
    $i = 0;
    foreach ($customer->shipping as $value) {
        table_row_start();
        table_cell('<b>' . $address_labels[$i++] . '</b>', '#DDFFFF');
        table_cell($value);
        table_row_end();
    }



    table_end();


}

function display_customer_form() {

    $customer_labels = array('Name');
    $address_labels = array('Street', 'City', 'State', 'Zip');
    $payment_labels = array('Bank', 'Account', 'SecurityCode');
    
    echo '</br><b>Enter your details:</b></br></br>';
    echo '<form method=POST action="submit_order.php">';
    table_start();
    display_form($customer_labels);
    display_form($address_labels);
    display_form($payment_labels);
    table_end();
    echo '<input type=submit name="Order" value="Submit Order"/></br>';
    echo '</form>'; 
}

?>
