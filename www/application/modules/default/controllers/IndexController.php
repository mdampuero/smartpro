<?php

/*
 * Author: Mauricio Ampuero 
 * Organization: Inamika Interactive
 * E-Mail: mdampuero@gmail.com
 */

require_once 'BaseController.php';

class IndexController extends BaseController {

    public function init(){
        parent::init();
        $this->view->login = $this->_helper->Login->isLoginPublic(true);
    }
    
    public function indexAction() {
        
    }

}
