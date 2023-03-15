<?php

class cDocente {

    public $metodos;

    public function __construct() {
        $metodos = new mMetodos();
    }

    public function verTodos($datos) {
        $sql = "SELECT * FROM `docente` WHERE  concat(nomDoc,' ',apepaDoc,' ',apemaDoc) like '%{$datos['busq']}%';";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function verUno($datos) {
        $sql = "SELECT * FROM `docente` WHERE  idDoc='{$datos['idDoc']}'";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function crear($datos) {
        $sql = "INSERT INTO `docente`(`dniDoc`,`claveDoc`,`nomDoc`,`apepaDoc`,`apemaDoc`,`foto`,`est`) VALUES 
('{$datos['dniDoc']}','{$datos['claveDoc']}','{$datos['nomDoc']}','{$datos['apepaDoc']}','{$datos['apemaDoc']}','{$datos['foto']}','{$datos['est']}');";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function modificar($datos) {
        $sql = "UPDATE `docente` SET "
                . "`dniDoc`='{$datos['dniDoc']}',"
                . "`claveDoc`='{$datos['claveDoc']}',"
                . "`nomDoc`='{$datos['nomDoc']}',"
                . "`apepaDoc`='{$datos['apepaDoc']}',"
                . "`apemaDoc`='{$datos['apemaDoc']}',"
                . "`foto`='{$datos['foto']}',"
                . "`est`='{$datos['est']}' "
                . "WHERE `idDoc`='{$datos['idDoc']}'";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    function AgregarHuellas($datos) {
        $sql = "UPDATE `docente` SET `imghuella1` = '{$datos['imghuella1']}', `imghuella2` = '{$datos['imghuella2']}' WHERE (`idDoc` = '{$datos['idDoc']}');";
        //echo $sql;
        $resp = $this->metodos->ejecutar($sql, "correcto");
        return $resp;
    }

}
