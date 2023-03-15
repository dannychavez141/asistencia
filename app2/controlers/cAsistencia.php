<?php

class cAsistencia {

    public $metodos;

    public function __construct() {
        $metodos = new mMetodos();
    }

    public function verTodos($datos) {
        $sql = "SELECT a.*,d.idDoc,d.dniDoc, d.claveDoc, d.nomDoc, d.apepaDoc, d.apemaDoc, d.foto, d.est FROM asistencia a 
left join docente d on a.idDoc= d.idDoc WHERE  concat(d.nomDoc,' ',d.apepaDoc,' ',d.apemaDoc) like '%{$datos['busq']}%'";
        if ($datos['idDoc'] > 0) {
            $sql .= " and a.idDoc= '{$datos['idDoc']}' ";
        }
        if ($datos['idMes'] > 0) {
            $sql .= " and MONTH(a.day)= '{$datos['idMes']}' ";
        }
        if ($datos['rango'] > 0) {
            $sql .= " and (a.day) BETWEEN '{$datos['fIni']}' AND '{$datos['fFin']}'";
        }

        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function verUno($datos) {
        $sql = "SELECT a.*,d.idDoc,d.dniDoc, d.claveDoc, d.nomDoc, d.apepaDoc, d.apemaDoc, d.foto, d.est FROM asistencia a 
left join docente d on a.idDoc= d.idDoc WHERE  a.idDoc='{$datos['idDoc']}' order by a.idAsist desc limit 1";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function crearEntrada($datos) {
        $sql = "INSERT INTO `asistencia`(`idDoc`, `day`, `in`) VALUES
('{$datos['idDoc']}','{$datos['day']}','{$datos['in']}');";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function crearSalida($datos) {
        $sql = "UPDATE `asistencia` SET "
                . "`out`='{$datos['out']}',"
                . "WHERE `idAsist`='{$datos['idAsist']}'";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

}
