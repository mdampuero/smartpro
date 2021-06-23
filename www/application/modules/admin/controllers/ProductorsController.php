<?php

/*
 * Author: Mauricio Ampuero 
 * Organization: Inamika Interactive
 * E-Mail: mdampuero@gmail.com
 */

require_once 'Productors.php';
require_once 'Common.php';
require_once 'Controller.php';

class Admin_ProductorsController extends Controller {

    protected $messageDelete = "¿Esta seguro que desea eliminar este Productor?";

    public function init() {
        $fields = array(
            array('field' => 'pr_id', 'type' => 'hidden'),
            array('field' => 'pr_name', 'label' => 'Nombre'),
            array('field' => 'pr_email', 'label' => 'E-Mail'),
            array('field' => 'pr_password', 'label' => 'Contraseña'),
            array('field' => 'pr_phone', 'label' => 'Teléfono', 'required' => ''),
            array('field' => 'pr_observation', 'label' => 'Observaciones', 'type' => 'textarea'),
            array('field' => '','type' => 'partial-view', 'file' => '_formAjax.phtml'),
            array('field' => '','type' => 'partial-view', 'file' => $this->_request->getParam('controller').'/form.phtml'),
        );
        $actions = array(
            array('type' => 'link', 'label' => 'Agregar ' . $this->singular, 'icon' => 'plus', 'controller' => $this->_request->getParam('controller'), 'action' => 'add'),
            array('type' => 'link', 'label' => 'Listar ' . $this->plural, 'icon' => 'list', 'controller' => $this->_request->getParam('controller'), 'action' => 'index')
        );
        parent::init($fields, $actions, []);
        $this->model = new Model_DBTable_Productors();
    }

    public function indexAction(){
        $this->view->messageDelete=$this->messageDelete;
    }
    
}
