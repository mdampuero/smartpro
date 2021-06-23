<?php

class BaseController extends Zend_Controller_Action {

    public function init() {
        $this->view->parameters = $this->_request->getParams();
        Zend_Layout::startMvc(array('layout' => 'default', 'layoutPath' => '../application/modules/default/layouts/scripts/'));
    }
    
}

?>