<?php

/*
 * Author: Mauricio Ampuero 
 * Organization: Inamika Interactive
 * E-Mail: mdampuero@gmail.com
 */
class Model_DBTable_Customer extends Zend_Db_Table_Abstract {

    protected $_name = 'sg_customer';
    protected $names = 'cu_name';
    protected $primary = 'cu_id';
    protected $deleted = 'cu_deleted';
    protected $status = 'cu_status';
    protected $modified = 'cu_modified';
    protected $created = 'cu_created';
    protected $defultSort = 'cu_name';
    protected $defultOrder = 'ASC';

    public function init() {
        
    }

    public function showAll($where = null, $sort = null, $order = null) {

        $select = $this->select();
        $select->setIntegrityCheck(false);
        $select->from(array($this->_name), array("*", "(CASE " . $this->_name . "." . $this->status . " when 1 then 'Habilitado' when 0 then 'Deshabilitado' end ) as " . $this->status . ""));
        $where = ($where == null) ? $this->deleted . "=0" : $this->deleted . "=0 AND " . $where;
        $sort = ($sort == null) ? $this->defultSort : $sort;
        $order = ($order == null) ? $this->defultOrder : $order;
        $select->where($where);
        $select->order($sort . ' ' . $order);
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

    public function add($parameters) {
        $parameters[$this->created] = time();
        $parameters[$this->modified] = $parameters[$this->created];
        $result = $this->showAll("cu_phone='" . $parameters["cu_phone"] . "'");
        if (!$result):
            $id = $this->insert($parameters);
            if ($id > 0) {
                return $id;
            } else {
                return null;
            }
        else:
            return $result[0]["cu_id"];
        endif;
    }

    public function edit($parameters, $id) {

        $parameters[$this->modified] = time();
        if ($id > 0) {
            $this->update($parameters, $this->primary . ' = ' . (int) $id);
        } else {
            return null;
        }
    }

    public function get($id) {

        $id = (int) $id;
        $select = $this->select();
        $select->from(array($this->_name), array("*"));
        $select->setIntegrityCheck(false);
        $select->where($this->primary . ' = ' . $id);
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

    public function clearData($conditions = 1) {
        $this->delete($conditions);
        return $this->info(Zend_Db_Table::NAME);
    }

}

?>