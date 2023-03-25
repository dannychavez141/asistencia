<?php

class cUsuario {

    public $metodos;

    public function __construct() {
        $this->metodos = new mMetodos();
    }

    public function verTodos($datos) {
        $sql = "SELECT * FROM `usuario` WHERE  concat(nombUsu,' ',apepaUsu,' ',apemaUsu) like '%{$datos['busq']}%' ;";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function verUno($datos) {
        $sql = "SELECT * FROM `usuario` WHERE  idUsu='{$datos['idUsu']}'";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }
 public function login($datos) {
     if($datos['tipoUsu']=="ADMINISTRADOR"){
        $sql = "SELECT * FROM `usuario` WHERE  loginUsu='{$datos['loginUsu']}' and passUsu='{$datos['passUsu']}' and estUsu='1'";
       //echo $sql;
       }else{
           $sql = "SELECT * FROM `docente` WHERE  dniDoc='{$datos['loginUsu']}' and claveDoc='{$datos['passUsu']}' and est='1'"; 
       }
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }
    public function crear($datos) {
        $sql = "INSERT INTO `usuario`(`nombUsu`, `apepaUsu`, `apemaUsu`, `loginUsu`, `passUsu`) VALUES 
('{$datos['nombUsu']}','{$datos['apepaUsu']}','{$datos['apemaUsu']}','{$datos['loginUsu']}','{$datos['passUsu']}');";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function modificar($datos) {
        $sql = "UPDATE `usuario` SET "
                . "`nombUsu`='{$datos['nombUsu']}',"
                . "`apepaUsu`='{$datos['apepaUsu']}',"
                . "`apemaUsu`='{$datos['apemaUsu']}',"
                . "`loginUsu`='{$datos['loginUsu']}',"
                . "`passUsu`='{$datos['passUsu']}',"
                . "`estUsu`='{$datos['estUsu']}',"
                . "WHERE `idUsu`='{$datos['idUsu']}'";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

}
