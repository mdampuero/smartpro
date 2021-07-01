<?php

/*
 * Author: Mauricio Ampuero 
 * Organization: Inamika Interactive
 * E-Mail: mdampuero@gmail.com
 */

require_once 'BaseController.php';
require_once 'Sinister.php';
require_once 'State.php';
require_once 'Company.php';
require_once 'Sinisteraccesory.php';

class IndexController extends BaseController {

    public function init(){
        parent::init();
        $this->view->login = $this->_helper->Login->isLoginPublic(true);
    }
    
    public function indexAction() {
        $model = new Model_DBTable_Sinister();
        $this->view->sinisters=$model->showAll("si_pr_id=".$this->view->login["pr_id"],'si_id','DESC');
    }
    
    public function nuevoAction() {
        $state = new Model_DBTable_State();
        $company = new Model_DBTable_Company();
        $this->view->states=$state->listAll();
        $this->view->companies=$company->listAll();
    }
    
    public function siniestroAction() {
        $model = new Model_DBTable_Sinister();
        $sinisterAccesoryModel = new Model_DBTable_Sinisteraccesory();  
        $this->view->sinister=$model->get($this->_request->getParam('id'));
        $this->view->products=$sinisterAccesoryModel->getBySinister($this->view->sinister["si_id"]);
    }

}
