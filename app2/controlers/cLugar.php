<?php

class cLugar {

    public $metodos;

    public function __construct() {
        $this->metodos = new mMetodos();
    }

    public function ver($datos) {
        $sql = "SELECT * FROM lugar where descrLug like '%{$datos['descrLug']}%';";
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
       // echo $sql;
        $resp = $this->metodos->ejecutar($sql, "MODIFICADO CORRECTAMENTE");
        return $resp;
    }

}
