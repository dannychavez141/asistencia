<?php

class cUsuario {

    public $metodos;

    public function __construct() {
        $metodos = new mMetodos();
    }

    public function verTodos($datos) {
        $sql = "SELECT * FROM `usuario` WHERE  concat(nombUsu,' ',apepaUsu,' ',apemaUsu) like '%{$datos['busq']}%';";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function verUno($datos) {
        $sql = "SELECT * FROM `usuario` WHERE  idUsu='{$datos['idUsu']}'";
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
