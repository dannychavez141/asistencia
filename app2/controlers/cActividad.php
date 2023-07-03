<?php

class cActividad {

    public $metodos;

    public function __construct() {
        $this->metodos = new mMetodos();
    }

    public function ver($datos) {
        $sql = "SELECT * FROM actividad a
left join docente d on a.idDoc=d.idDoc
left join tipoactividad ta on a.idTipAct=ta.idTipAct
left join lugar l on a.idLug=l.idLug
where a.idDoc='{$datos['idDoc']}'";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function crear($datos) {
       // print_r($datos);
        $sql = "INSERT INTO `actividad`
(`idDoc`,
`idTipAct`,
`idLug`,
`descrAct`,
`hIniAct`,
`hFinAct`,`fechaAct`)
VALUES
('{$datos['idDoc']}',
'{$datos['idTipAct']}',
'{$datos['idLug']}',
'{$datos['descrAct']}',
'{$datos['hIniAct']}',
'{$datos['hFinAct']}','{$datos['fechaAct']}');";
       $resp = $this->metodos->ejecutar($sql, "REGISTRADO CORRECTAMENTE");
        return $resp;
    }

    public function modificar($datos) {
        $sql = "UPDATE `actividad` SET "
                . "`idDoc`='{$datos['idDoc']}',"
                . "`idTipAct`='{$datos['idTipAct']}',"
                . "`idLug`='{$datos['idLug']}',"
                . "`descrAct`='{$datos['descrAct']}',"
                . "`hIniAct`='{$datos['hIniAct']}',"
                . "`hFinAct`='{$datos['hFinAct']}'"
                . "WHERE `idAct`='{$datos['idAct']}'";
        $resp = $this->metodos->ejecutar($sql, "MODIFICADO CORRECTAMENTE");
        return $resp;
    }
public function verTipo() {
        $sql = "SELECT * FROM tipoactividad;";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }
}
