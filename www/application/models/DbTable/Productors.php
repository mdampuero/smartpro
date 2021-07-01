<?php

/*
 * Author: Mauricio Ampuero 
 * Organization: Inamika Interactive
 * E-Mail: mdampuero@gmail.com
 */

class Model_DBTable_Productors extends Zend_Db_Table_Abstract {

    protected $_name = 'sg_productors';

    public function listAll() {
        $getAllBuild=$this->builder();
        $rows = $this->fetchAll($getAllBuild);
        if (!$rows)
            $result=[];
        $results=(!$rows)?[]:$rows->toArray();
        $return=[];
        foreach($results as $key=>$result){
            $return[$result['pr_id']]=$result['pr_name'];
        }
        return $return;
    }
    
    public function showAll() {
        $getAllBuild=$this->builder();
        $rows = $this->fetchAll($getAllBuild);
        $results=(!$rows)?[]:$rows->toArray();
        return $results;
    }

    public function builder(){
        $select = $this->select();
        $select->from(array($this->_name), array("*"));
        $select->where("pr_deleted = 0");        
        $select->setIntegrityCheck(false);
        return $select;
    }

    public function get($id) {
        $select=$this->builder();
        $select->where("pr_id = ${id}");
        $row = $this->fetchRow($select);
        if (!$row) 
            return null;
        $return=$this->getStructure($row->toArray());
        return $return;
    }
    
    public function isExists($body) {
        $select=$this->builder();
        $select->where("pr_email = '".$body['pr_email']."' AND pr_id<>'".$body["pr_id"]."'");
        $row = $this->fetchRow($select);
        return ($row)?true:false;
    }

    public function total() {
        $select = $this->select();
        $select->from(array($this->_name), array("COUNT(*) AS total"));
        $select->where("pr_deleted = 0");
        $row = $this->fetchRow($select);
        return (int)$row->total;
    }

    public function search($string=null) {
        $buildSearch=$this->builder();
        if($string)
            $buildSearch->where("CONCAT(pr_id,pr_name,pr_email,pr_phone) LIKE '%${string}%'");
        return $buildSearch;
    }

    public function totalFiltered($string) {
        $select = $this->select();
        $select->from(array($this->_name), array("COUNT(*) AS total"));
        $select->where("pr_deleted = 0");
        $select->where("CONCAT(pr_id,pr_name,pr_email,pr_phone) LIKE '%${string}%'");
        $row = $this->fetchRow($select);
        return (int)$row->total;
    }

    public function getAll($limit=20,$offset=0,$string,$order) {
        $getAllBuild=$this->search($string);
        $getAllBuild->limit($offset,$limit);
        $getAllBuild->order($order);
        $rows = $this->fetchAll($getAllBuild);
        if (!$rows)
            return [];
        return $rows->toArray();
    }

    public function getStructure($data=array()){
        $structure=[];
        foreach($data as $key=>$value){
            switch($key){
                default:
                    $structure[$key]=$value;
            }  
        }
        return $structure;
    }

    public function dataIsValid($body){
        $errors=[];
        if(!key_exists('pr_id',$body))
            $errors[]=[
                "property"=>"pr_id",
                "message"=>"El valor es incorrecto"
            ];                            
        if(!key_exists('pr_name',$body) || empty($body["pr_name"]))
            $errors[]=[
                "property"=>"pr_name",
                "message"=>"El valor es incorrecto"
            ];                        
        if(!key_exists('pr_email',$body) || empty($body["pr_email"]) || !filter_var($body["pr_email"], FILTER_VALIDATE_EMAIL))
            $errors[]=[
                "property"=>"pr_email",
                "message"=>"El valor es incorrecto"
            ];   
                        
        if($this->isExists($body))
            $errors[]=[
                "property"=>"pr_email",
                "message"=>"El valor ya existe"
            ];  

        if(!key_exists('pr_password',$body) || empty($body["pr_password"]))
            $errors[]=[
                "property"=>"pr_password",
                "message"=>"El valor es incorrecto"
            ];                         
        if(count($errors))
            throw new Exception(json_encode($errors),400);
        return true;
    }

    public function save($body){
        try{        
            $this->dataIsValid($body);
            $pr_id=(int)$body['pr_id'];
            $data=[
                "pr_name"                 =>$body["pr_name"],
                "pr_email"                =>$body["pr_email"],
                "pr_password"             =>$body["pr_password"]
            ];
            if($pr_id==0){
                $data["pr_created"]=time();
                $data["pr_modified"]=time();
                $data["pr_deleted"]=0;
                $pr_id=$this->insert($data);
            }else{
                $data["pr_modified"]=time();
                $this->update($data,"pr_id={$pr_id}");
            }
            return $this->get($pr_id);
        }catch (Exception $e) {
            json_decode($e->getMessage());
            if(json_last_error() === JSON_ERROR_NONE)
                throw new Exception($e->getMessage(),$e->getCode());
            else
                throw new Exception(json_encode([$e->getMessage()],true),500);
        }
    }
    
    public function login($body){      
        $select=$this->builder();
        $select->where("pr_email = '".$body["pr_email"]."' AND pr_password='".$body["pr_password"]."'");
        $row = $this->fetchRow($select);
        if (!$row) 
            return null;
        return $this->getStructure($row->toArray());
    }
    public function deleteSoft($id){      
        $this->update(['pr_deleted'=>1],"pr_id={$id}");
        return true;
    }
}