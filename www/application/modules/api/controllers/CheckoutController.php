<?php

/*
 * Author: Mauricio Ampuero 
 * Organization: Inamika Interactive
 * E-Mail: mdampuero@gmail.com
 */

require_once 'Sinister.php';

class Api_CheckoutController extends Zend_Rest_Controller {

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->AjaxContext()->initContext('json');
        $parts = parse_url(urldecode($_SERVER['REQUEST_URI']));
        parse_str($parts['query'], $this->parameters);
        if($this->_request->getParam('action')=='index'){
            switch($this->_request->getMethod()){
                case 'POST':
                    return $this->postAction();
                    break;
                case 'DELETE':
                    return $this->deleteAction();
                    break;
            }
        }
    }

    public function postAction(){
        try{
            $model = new Model_DBTable_Sinister();
            $this->_mail = $this->_helper->Mail;
            $body=file_get_contents('php://input');
            Zend_Controller_Action_HelperBroker::getStaticHelper('Log')->setLog(array('lo_request'=>'','lo_description'=>'Checkout->POST','lo_data'=>$body));
            $data=$model->addProduct(json_decode($body,true));

            /** ENVÍO DE PEDIDO AL PROVEEDOR*/
            $this->view->products=$data['products'];
            $body = $this->view->render('email/order.phtml');
            $html = file_get_contents(PUBLIC_PATH . DS . "html" . DS . "template.html");
            $html = str_replace("##contentEmail##", $body, $html);
            $this->_mail->sendEmail($html, "Nota de pedido de SmartPro", [$data['products'][0]["pr_email"]]);
            
            /** NOTIFICACION AL PRODUCTOR */
            $this->view->sinister=$data["sinister"];
            $body = $this->view->render('email/notification.phtml');
            $html = file_get_contents(PUBLIC_PATH . DS . "html" . DS . "template.html");
            $html = str_replace("##contentEmail##", $body, $html);
            $this->_mail->sendEmail($html, "Cambio de estado siniestro Nº ".$data["sinister"]["si_number"], [$data["sinister"]["pr_email"]]);

            $this->getResponse()->setBody($this->_helper->json($data));
        }catch (Exception $e) {
            $this->getResponse()->setHttpResponseCode($e->getCode());
            $this->getResponse()->setBody($this->_helper->json([
                'result'=>false,
                'data'=>json_decode($e->getMessage(),true)
            ]));
        }
    }
    
    public function indexAction(){}
    public function getAction(){}
    public function deleteAction(){}
    public function putAction(){}

}
