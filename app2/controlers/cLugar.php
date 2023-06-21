<?php

class cLugar {

    public $metodos;

    public function __construct() {
        $this->metodos = new mMetodos();
    }

    public function ver() {
        $sql = "SELECT * FROM lugar";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function crear($datos) {
        $sql = "INSERT INTO `lugar`
(`descrLug`,
`dirLug`,
`telfLug`,
`altLug`,
`latLug`)
VALUES
('{$datos['descrLug']}',
'{$datos['dirLug']}',
'{$datos['telfLug']}',
'{$datos['altLug']}',
'{$datos['latLug']}');";
        $resp = $this->metodos->ejecutar($sql, "REGISTRADO CORRECTAMENTE");
        return $resp;
    }

    public function modificar($datos) {
        $sql = "UPDATE `lugar` SET "
                . "`descrLug`='{$datos['descrLug']}',"
                . "`dirLug`='{$datos['dirLug']}',"
                . "`telfLug`='{$datos['telfLug']}',"
                . "`altLug`='{$datos['altLug']}',"
                . "`latLug`='{$datos['latLug']}',"
                . "`estLug`='{$datos['estLug']}'"
                . "WHERE `idLug`='{$datos['idLug']}'";
        $resp = $this->metodos->ejecutar($sql, "MODIFICADO CORRECTAMENTE");
        return $resp;
    }

}
