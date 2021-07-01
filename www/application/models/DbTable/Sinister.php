<?php

/*
 * Author: Mauricio Ampuero 
 * Organization: Inamika Interactive
 * E-Mail: mdampuero@gmail.com
 */
require_once 'Accesory.php';
require_once 'Sinisteraccesory.php';
require_once 'Provider.php';

class Model_DBTable_Sinister extends Zend_Db_Table_Abstract {

    protected $_name = 'sg_sinister';
    protected $names = 'si_name';
    protected $primary = 'si_id';
    protected $deleted = 'si_deleted';
    protected $status = 'si_status';
    protected $modified = 'si_modified';
    protected $created = 'si_created';
    protected $defultSort = 'si_id';
    protected $defultOrder = 'DESC';

    public function getStatus(){
        return array(
            1  => 'Falta definir productos',
            2  => 'En espera de productos',
            3  => 'Ingresado sin entregar',
            4  => 'Entregado',
            5  => 'Facturado',
            60 => 'Dado de baja'
        );
    }
    public function init() {
        $this->view = Zend_Layout::getMvcInstance()->getView();
    }

    public function showAll($where = null, $sort = null, $order = null, $limit = 0) {

        $select = $this->select();
        $select->setIntegrityCheck(false);
        $select->from(array($this->_name), array("*", "(CASE " . $this->_name . "." . $this->status . " "
            . "when 1 then '<span class=\"text-danger\"><b>Falta definir productos</b></span>' "
            . "when 2 then '<span class=\"text-warning\"><b>En espera de productos</b></span>' "
            . "when 3 then '<span class=\"text-secondary\"><b>Ingresado sin entregar</b></span>' "
            . "when 4 then '<span class=\"text-primary\"><b>Entregado</b></span>' "
            . "when 5 then '<span class=\"text-success\"><b>Facturado</b></span>' "
            . "when 60 then '<span class=\"text-muted\"><b>Dado de baja</b></span>' "
            . " end ) as status_label", "(CASE " . $this->_name . ".si_data_complete "
            . "when 1 then '<span class=\"text-success\"><b><span class=\"glyphicon glyphicon-ok-circle\"></span></span></b>' "
            . "when 0 then '<span class=\"text-danger\"><b><span class=\"glyphicon glyphicon-exclamation-sign\"></span></span></b>' "
            . " end ) as si_data_complete","si_days as days"));
        $where = ($where == null) ? $this->deleted . "=0" : $this->deleted . "=0 AND " . $where;
        $sort = ($sort == null) ? $this->defultSort : $sort;
        $order = ($order == null) ? $this->defultOrder : $order;
        $select->where($where);
        $select->order($sort . ' ' . $order);
         $select->joinLeft("sg_company as co", "co.co_id=" . $this->_name . ".si_co_id");
        $select->joinLeft("sg_productors as pr", "pr.pr_id=" . $this->_name . ".si_pr_id");
        $select->joinLeft("sg_branch as br", "br.br_id=" . $this->_name . ".si_br_id");
        $select->joinLeft("sg_model as mo", "mo.mo_id=" . $this->_name . ".si_mo_id");
        $select->joinLeft("sg_tbranch as tb_au", "tb_au.tb_id=" . $this->_name . ".si_tb_id_au", array("CONCAT('[',COALESCE(tb_au.tb_code,''),'] - ',tb_au.tb_name) as tb_name_au"));
        $select->joinLeft("sg_tbranch as tb_po", "tb_po.tb_id=" . $this->_name . ".si_tb_id_po", array("CONCAT('[',COALESCE(tb_po.tb_code,''),'] - ',tb_po.tb_name) as tb_name_po"));
        $select->joinLeft("sg_cbranch as cb", "cb.cb_id=" . $this->_name . ".si_cb_id",array("CONCAT('[',COALESCE(cb.cb_code,''),'] - ',cb.cb_name) as cb_name"));
        $select->joinLeft("sg_bbranch as bb", "bb.bb_id=" . $this->_name . ".si_bb_id",array("CONCAT('[',COALESCE(bb.bb_code,''),'] - ',bb.bb_name) as bb_name"));
        $select->joinLeft("sg_provider as pr_po", "pr_po.pr_id=" . $this->_name . ".si_po_pr_id", array("pr_po.pr_name as pr_po_name"));
        $select->joinLeft("sg_provider as pr_ba", "pr_ba.pr_id=" . $this->_name . ".si_ba_pr_id", array("pr_ba.pr_name as pr_ba_name"));
        $select->joinLeft("sg_provider as pr_au", "pr_au.pr_id=" . $this->_name . ".si_au_pr_id", array("pr_au.pr_name as pr_au_name"));
        $select->joinLeft("sg_provider as pr_co", "pr_co.pr_id=" . $this->_name . ".si_co_pr_id", array("pr_co.pr_name as pr_co_name"));
        $select->limit($limit);
        $results = $this->fetchAll($select);
        $resultsArray=$results->toArray();
        // echo count($resultsArray);
        return $results->toArray();
    }
    public function showAllCustomer($where = null, $sort = null, $order = null, $limit = 0) {

        $select = $this->select();
        $select->setIntegrityCheck(false);
        $select->from(array($this->_name), array("DISTINCT(si_fullname)","si_id","si_fullname","si_phone","si_email","si_customer_address"));
        $where = ($where == null) ? $this->deleted . "=0 AND (si_fullname<>'' OR si_phone<>'' OR si_email<>'')" : $this->deleted . "=0 AND (si_fullname<>'' OR si_phone<>'' OR si_email<>'') AND " . $where;
        $sort = ($sort == null) ? $this->defultSort : $sort;
        $order = ($order == null) ? $this->defultOrder : $order;
        $select->where($where);
        $select->order($sort . ' ' . $order);
        $select->joinLeft("sg_company as co", "co.co_id=" . $this->_name . ".si_co_id");
        $select->limit($limit);
        $results = $this->fetchAll($select);
        return $results->toArray();
    }

    public function listAll($where = null, $sort = null, $order = null) {
        $result = $this->showAll($where, $sort, $order);
        if (count($result)):
            foreach ($result as $value):
                foreach ($value as $key => $val):
                    if ($key == $this->primary):
                        $names = explode("|", $this->names);
                        $contact = null;
                        foreach ($names as $name):
                            $contact.=$value[$name] . " ";
                        endforeach;
                        $list[$val] = trim($contact);
                    endif;
                endforeach;
            endforeach;
        else:
            $list = null;
        endif;
        return $list;
    }

    public function isDuplicated($si_number,$si_domain,$si_id=0, $formato="html") {
        $select = $this->select();
        $select->from(array($this->_name), array("si_id"));
        $select->setIntegrityCheck(false);
        $select->where('si_number = "' . $si_number.'" AND si_domain="'.$si_domain.'" AND si_id<>'.$si_id.' AND si_deleted=0');
        $row = $this->fetchRow($select);
        $url=$this->view->url(array('action'=>'detail','id'=>2));
        $link=null;
        if($formato=="html"):
            $link="haga click <a href='".$url."'>AQUÍ</a> para verlo.";
        endif;
        if ($row) 
            throw new Zend_Controller_Action_Exception("Ya existe un Siniestro cargado con el Nº $si_number y Dominio $si_domain.".$link);
        return FALSE;
    }
    
    public function add($parameters,$formato="html") {
        if($this->isDuplicated($parameters["si_number"],$parameters["si_domain"],0,$formato));
        $parameters[$this->created] = time();
        $parameters[$this->modified] = $parameters[$this->created];
        $id = $this->insert($parameters);
        if ($id > 0) {
            return $id;
        } else {
            return null;
        }
    }

    public function edit($parameters, $id,$formato="html") {
        if($this->isDuplicated($parameters["si_number"],$parameters["si_domain"],$id,$formato));
        $parameters[$this->modified] = time();
        if ($id > 0) {
            $this->update($parameters, $this->primary . ' = ' . (int) $id);
        } else {
            return null;
        }
    }
   
    public function updateDays() {
        return $this->update(array("si_days"=>new Zend_Db_Expr("CONCAT(datediff('".date('Y-m-d')."',si_date),'')")), "si_status NOT IN(60,5)");
    }

    public function get($id) {
        $id = (int) $id;
        $select = $this->select();
        $select->from(array($this->_name), array("*", "(CASE " . $this->_name . "." . $this->status . " "
            . "when 1 then 'Falta definir productos' "
            . "when 2 then 'En espera de productos' "
            . "when 3 then 'Ingresado sin entregar' "
            . "when 4 then 'Entregado' "
            . "when 5 then 'Facturado' "
            . " end ) as status_label"));
        $select->setIntegrityCheck(false);
        $select->where($this->primary . ' = ' . $id);
        $select->joinLeft("sg_seller as se", "se.se_id=" . $this->_name . ".si_se_id");
        $select->joinLeft("sg_company as co", "co.co_id=" . $this->_name . ".si_co_id");
        $select->joinLeft("sg_productors as pr", "pr.pr_id=" . $this->_name . ".si_pr_id");
        $select->joinLeft("sg_branch as br", "br.br_id=" . $this->_name . ".si_br_id");
        $select->joinLeft("sg_model as mo", "mo.mo_id=" . $this->_name . ".si_mo_id");
        $select->joinLeft("sg_state as st", "st.st_id=" . $this->_name . ".si_st_id",array("st.st_state as state_name"));
        $select->joinLeft("sg_tbranch as tb_au", "tb_au.tb_id=" . $this->_name . ".si_tb_id_au", array("CONCAT('[',COALESCE(tb_au.tb_code,''),'] - ',tb_au.tb_name) as tb_name_au"));
        $select->joinLeft("sg_tbranch as tb_po", "tb_po.tb_id=" . $this->_name . ".si_tb_id_po", array("CONCAT('[',COALESCE(tb_po.tb_code,''),'] - ',tb_po.tb_name) as tb_name_po"));
        $select->joinLeft("sg_cbranch as cb", "cb.cb_id=" . $this->_name . ".si_cb_id",array("CONCAT('[',COALESCE(cb.cb_code,''),'] - ',cb.cb_name) as cb_name"));
        $select->joinLeft("sg_bbranch as bb", "bb.bb_id=" . $this->_name . ".si_bb_id",array("CONCAT('[',COALESCE(bb.bb_code,''),'] - ',bb.bb_name) as bb_name"));
        $select->joinLeft("sg_provider as pr_po", "pr_po.pr_id=" . $this->_name . ".si_po_pr_id", array("pr_po.pr_name as pr_po_name"));
        $select->joinLeft("sg_provider as pr_ba", "pr_ba.pr_id=" . $this->_name . ".si_ba_pr_id", array("pr_ba.pr_name as pr_ba_name"));
        $select->joinLeft("sg_provider as pr_au", "pr_au.pr_id=" . $this->_name . ".si_au_pr_id", array("pr_au.pr_name as pr_au_name"));
        $select->joinLeft("sg_provider as pr_co", "pr_co.pr_id=" . $this->_name . ".si_co_pr_id", array("pr_co.pr_name as pr_co_name"));
        $row = $this->fetchRow($select);
        if (!$row) {
            return null;
        }
        return $row->toArray();
    }

    public function delete_row($id) {

        return $this->delete($this->primary . ' = ' . (int) $id);
    }

    public function delete_slow($id) {

        $parameters[$this->modified] = time();
        $parameters[$this->deleted] = 1;
        if ($id > 0) {
            $this->update($parameters, $this->primary . ' = ' . (int) $id);
        } else {
            return null;
        }
    }
    public function optimized(){
        $this->update(array('si_deleted'=>1),'si_date  <  DATE_SUB(curdate(), INTERVAL 1 YEAR)');
        return true;
    }

    public function clearData($conditions = 1) {
        $this->delete($conditions);
        return $this->info(Zend_Db_Table::NAME);
    }





    /***
     * 
     * 
     * 
     * 
     * 
     */
    public function builder(){
        $select = $this->select();
        $select->from(array($this->_name), array("*"));
        $select->where("si_deleted = 0");        
        $select->setIntegrityCheck(false);
        return $select;
    }

    public function isExists($body) {
        $select=$this->builder();
        $select->where("si_number = '".$body['si_number']."' AND si_deleted=0");
        $row = $this->fetchRow($select);
        return ($row)?true:false;
    }
    
    public function getByNumber($number) {
        $select=$this->builder();
        $select->where("si_number = '".$number."' AND si_deleted=0");
        $row = $this->fetchRow($select);
        return ($row)?$row->toArray():null;
    }

    public function dataIsValid($body){
        $errors=[];
        if(!key_exists('si_id',$body))
            $errors[]=[
                "property"=>"si_id",
                "message"=>"El valor es incorrecto"
            ];                            
        if(!key_exists('si_pr_id',$body) || empty($body["si_pr_id"]))
            $errors[]=[
                "property"=>"si_pr_id",
                "message"=>"El valor es incorrecto"
            ];                        
        if(!key_exists('si_number',$body) || empty($body["si_number"]))
            $errors[]=[
                "property"=>"si_number",
                "message"=>"El valor es incorrecto"
            ];                        
       
        if($this->isExists($body))
            $errors[]=[
                "property"=>"si_number",
                "message"=>"Este número ya fue cargado"
            ];      
        if(!key_exists('si_amount',$body) || empty($body["si_amount"]) || !is_numeric($body["si_amount"]))
            $errors[]=[
                "property"=>"si_amount",
                "message"=>"El valor es incorrecto"
            ];  
        $dateArray=explode("/",$body["si_date"]);
        if(!key_exists('si_date',$body) || empty($body["si_date"]) || !checkdate($dateArray[1],$dateArray[0],$dateArray[2]))
            $errors[]=[
                "property"=>"si_date",
                "message"=>"El valor es incorrecto, formato dd/mm/aaaa"
            ];    
        if(!key_exists('si_date',$body) || empty($body["si_date"]))
            $errors[]=[
                "property"=>"si_date",
                "message"=>"El valor es incorrecto"
            ];    
        if(!key_exists('si_fullname',$body) || empty($body["si_fullname"]) || strlen($body["si_fullname"])<3)
            $errors[]=[
                "property"=>"si_fullname",
                "message"=>"El valor es incorrecto"
            ];    
        if(!key_exists('si_document',$body) || empty($body["si_document"]) || strlen($body["si_document"])<7)
            $errors[]=[
                "property"=>"si_document",
                "message"=>"El valor es incorrecto"
            ];    
        if(!key_exists('si_st_id',$body) || empty($body["si_st_id"]))
            $errors[]=[
                "property"=>"si_st_id",
                "message"=>"El valor es incorrecto"
            ];    
        if(!key_exists('si_city',$body) || empty($body["si_city"]))
            $errors[]=[
                "property"=>"si_city",
                "message"=>"El valor es incorrecto"
            ];    
        if(!key_exists('si_address_street',$body) || empty($body["si_address_street"]))
            $errors[]=[
                "property"=>"si_address_street",
                "message"=>"El valor es incorrecto"
            ];    
        if(!key_exists('si_address_number',$body) || empty($body["si_address_number"]))
            $errors[]=[
                "property"=>"si_address_number",
                "message"=>"El valor es incorrecto"
            ];    
            
        if(!key_exists('si_address_postal',$body) || empty($body["si_address_postal"]))
            $errors[]=[
                "property"=>"si_address_postal",
                "message"=>"El valor es incorrecto"
            ];    
            
        if(!empty($body["si_email"]) && !filter_var($body["si_email"], FILTER_VALIDATE_EMAIL))
            $errors[]=[
                "property"=>"si_email",
                "message"=>"El valor es incorrecto"
            ];   
        
        if(!key_exists('si_co_id',$body) || empty($body["si_co_id"]))
            $errors[]=[
                "property"=>"si_co_id",
                "message"=>"El valor es incorrecto"
            ];                   
        if(count($errors))
            throw new Exception(json_encode($errors),400);
        return true;
    }

    public function save($body){
        try{        
            $this->dataIsValid($body);
            $si_di=(int)$body['si_di'];
            $dateArray=explode("/",$body["si_date"]);
            $dateEn=$dateArray[2].'-'.$dateArray[1].'-'.$dateArray[0];
            $data=[
                "si_pr_id"            =>$body["si_pr_id"],
                "si_number"           =>$body["si_number"],
                "si_date"             =>$dateEn,
                "si_amount"           =>$body["si_amount"],
                "si_fullname"         =>$body["si_fullname"],
                "si_document"         =>$body["si_document"],
                "si_email"            =>$body["si_email"],
                "si_phone"            =>$body["si_phone"],
                "si_st_id"            =>$body["si_st_id"],
                "si_co_id"            =>$body["si_co_id"],
                "si_city"            =>$body["si_city"],
                "si_address_street"=>$body["si_address_street"],
                "si_address_number"=>$body["si_address_number"],
                "si_address_dpto"=>$body["si_address_dpto"],
                "si_address_floor"=>$body["si_address_floor"],
                "si_address_postal"=>$body["si_address_postal"],
                "si_observation_loan"=>$body["si_observation_loan"],
                "si_data_complete"=>1,
            ];
            if($si_di==0){
                $data["si_created"]=time();
                $data["si_modified"]=time();
                $data["si_deleted"]=0;
                $data["si_status"]=1;
                $si_di=$this->insert($data);
                $data=$this->get($si_di);
                $data=$this->translate($data);
            }else{
                $data["si_modified"]=time();
                $this->update($data,"si_di={$si_di}");
                $data=$this->get($si_di);
            }
            return $data;
        }catch (Exception $e) {
            json_decode($e->getMessage());
            if(json_last_error() === JSON_ERROR_NONE)
                throw new Exception($e->getMessage(),$e->getCode());
            else
                throw new Exception(json_encode([$e->getMessage()],true),500);
        }
    }
    public function addProduct($body){
        try{      
            $sinisterAccesoryModel = new Model_DBTable_Sinisteraccesory();  
            $accesoryModel = new Model_DBTable_Accesory();  
            $providerModel = new Model_DBTable_Provider();  
            $provider=$providerModel->get(1); 
            
            $sinister=$this->getByNumber($body["siniestro"]);
            if(key_exists('productos',$body) || !empty($body["productos"])){
                foreach($body['productos'] as $producto){
                    if(!$accesory=$accesoryModel->getByCode($producto["sku"])){
                        $accesory=$accesoryModel->add(['ac_name'=>$producto['descripcion'],'ac_code'=>$producto['sku']]);
                    }else{
                        $accesoryModel->edit(['ac_name'=>$producto['descripcion'],'ac_deleted'=>0],$accesory["ac_id"]);
                        $accesory["ac_name"]=$producto['descripcion'];
                    }
                    $sinisterAccesoryModel->add([
                        'sa_si_id'=>$sinister['si_id'],
                        'sa_ac_id'=>$accesory['ac_id'],
                        'sa_count'=>$producto['cantidad'],
                        'sa_in_stock'=>0,
                        'sa_pr_id'=>$provider["pr_id"],
                        'sa_date_from'=>date('Y-m-d')
                    ]);
                }
                $this->edit(["si_status"=>2],$sinister["si_id"]);
                return [
                        'products'=>$sinisterAccesoryModel->getBySinister($sinister["si_id"]),
                        'sinister'=>$this->get($sinister["si_id"])
                    ];
            }
            return null;
        }catch (Exception $e) {
            json_decode($e->getMessage());
            if(json_last_error() === JSON_ERROR_NONE)
                throw new Exception($e->getMessage(),$e->getCode());
            else
                throw new Exception(json_encode([$e->getMessage()],true),500);
        }
    }

    public function translate($data){
        $dataClear=[
            'siniestro'=>$data["si_number"],
            'compania'=>$data["co_name"],
            'fecha'=>$data["si_date"],
            'monto'=>$data["si_amount"],
            'nombre_completo'=>$data["si_fullname"],
            'documento'=>$data["si_document"],
            'email'=>$data["si_email"],
            'telefono'=>$data["si_phone"],
            'provincia'=>$data["state_name"],
            'departamento'=>$data["si_city"],
            "codigo_postal"=>$data["si_address_postal"],
            "calle"=>$data["si_address_street"],
            "numero"=>$data["si_address_number"],
            "depto"=>$data["si_address_dpto"],
            "piso"=>$data["si_address_floor"],
            'observaciones'=>$data["si_observation_loan"]
        ];
        return $dataClear;

    }
}

?>