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
| Author: SL                                                           |
+----------------------------------------------------------------------+
$Id: EmailService.php,v 1.1.2.1 2007/04/27 11:17:45 slaws Exp $
*/

include 'SCA/SCA.php';

/**
 * Service for sending emails
 * 
 * @service
 * @binding.soap
 *
 */
class EmailService {

    /**
     * The default timezone
     *
     * @var string
     */
    public $timezone = 'Europe/London';

    /**
     * Send a simple text email
     *
     * @param string $to The "to" email address
     * @param string $from The "from" email address
     * @param string $subject The subject of the email
     * @param string $message The email message
     * @return boolean
     */
    public function send($to, $from, $subject, $message) {
        trigger_error("Sending email to: $to from: $from subject: $subject message: $message");
        date_default_timezone_set($this->timezone);
        //return mail($to, $subject, $message, "From: $from");
        return true;
    }


}

?>