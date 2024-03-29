<?php

/*
 * Author: Mauricio Ampuero 
 * Organization: Inamika Interactive
 * E-Mail: mdampuero@gmail.com
 */

require_once 'Productors.php';

class Api_ProductorsController extends Zend_Rest_Controller {

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

    public function indexAction() {
        $model = new Model_DBTable_Productors();
        $this->getResponse()->setBody($this->_helper->json([
            'result'=>true,
            'recordsTotal'=>$model->total(),
            'recordsFiltered'=>$model->totalFiltered($this->parameters["search"]["value"]),
            'data'=>$model->getAll($this->parameters["start"],$this->parameters["length"],$this->parameters["search"]["value"],$this->parameters["sort"]." ".$this->parameters["direction"])
        ]));
        $this->getResponse()->setHttpResponseCode(200);
        
    }

    public function getAction(){
        $model = new Model_DBTable_Productors();
        if(!$data=$model->get($this->_request->getParam('id')))
            $this->getResponse()->setHttpResponseCode(404);
        $this->getResponse()->setBody($this->_helper->json($data));
    }

    public function postAction(){
        try{
            $model = new Model_DBTable_Productors();
            $this->getResponse()->setBody($this->_helper->json($model->save(json_decode(file_get_contents('php://input'),true))));
        }catch (Exception $e) {
            $this->getResponse()->setHttpResponseCode($e->getCode());
            $this->getResponse()->setBody($this->_helper->json([
                'result'=>false,
                'data'=>json_decode($e->getMessage(),true)
            ]));
        }
    }

    public function loginAction(){
        $model = new Model_DBTable_Productors();
        $user=$model->login(json_decode(file_get_contents('php://input'),true));
        if($user){
            $this->_helper->Login->loginInPublic($user);
            $this->getResponse()->setHttpResponseCode(200);
        }
        else
            $this->getResponse()->setHttpResponseCode(404);
        $this->getResponse()->setBody($this->_helper->json([]));
    }
    
    public function logoutAction(){
        $this->_helper->Login->logOutPublic();
        $this->getResponse()->setBody($this->_helper->json([]));
    }

    public function deleteAction() {
        $model = new Model_DBTable_Productors();
        $model->deleteSoft($this->_request->getParam('id'));
        $this->getResponse()->setBody($this->_helper->json('OK'));
    }

    public function putAction(){}

}
