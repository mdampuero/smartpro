<?php

require_once 'PHPMailer/class.phpmailer.php';

class Zend_Controller_Action_Helper_Mail extends Zend_Controller_Action_Helper_Abstract {

    public function __construct() {
        $this->_setting = Zend_Controller_Action_HelperBroker::getStaticHelper('Setting');
        $setting = $this->_setting->getSetting();
        $this->host = 'c2210292.ferozo.com';
        $this->port = 465;
        $this->username = 'siniestros@smart-pro.com.ar';
        $this->password = '/0@xgSJ0sC';
        $this->email = 'siniestros@smart-pro.com.ar';
        $this->name = "SmartPro";
        $this->secure = 'ssl';
//         $phpmailer = new PHPMailer();
// $phpmailer->isSMTP();
// $phpmailer->Host = 'smtp.mailtrap.io';
// $phpmailer->SMTPAuth = true;
// $phpmailer->Port = 2525;
// $phpmailer->Username = 'a4140ccebccb5f';
// $phpmailer->Password = 'ad647ff494915d';
    }

    public function sendEmail($contenido, $asunto, $toEmails = []) {
//        try {
             
           
            if (!$toName) {
                $toName = $this->name;
            }
            $this->mail = new PHPMailer();
            $this->mail->IsSMTP();
            if ($this->secure):
                $this->mail->SMTPSecure = $this->secure;
            endif;
            $this->mail->SMTPAuth = true;
            $this->mail->Host = $this->host;
            $this->mail->Port = $this->port;
            $this->mail->Username = $this->username;
            $this->mail->Password = $this->password;
            foreach($toEmails as $to){
                $this->mail->AddAddress($to);
            }
            $this->mail->addBCC($this->email);
            $this->mail->SetFrom($this->email, $this->name);
            $this->mail->Subject = utf8_decode($asunto);
            $this->mail->MsgHTML(utf8_decode($contenido));
            if (!$this->mail->Send()) {
                throw new Zend_Controller_Action_Exception("Error de autenticación SMTP", 599);
            }
//        } catch (Exception $ex) {
//            throw new Zend_Controller_Action_Exception($ex->getMessage(), 599);
//        }
    }

}

?>