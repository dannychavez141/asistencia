<?php

class cAsistencia {

    public $metodos;

    public function __construct() {
        $this->metodos = new mMetodos();
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

    public function verPorDia($datos) {
        $sql = "SELECT a.*,d.idDoc,d.dniDoc,d.nomDoc,d.apepaDoc,d.apemaDoc,d.foto,d.est FROM asistencia a 
left join docente d on a.idDoc=d.idDoc where a.fechaAsist='{$datos['fechaAsist']}' order by a.idAsist desc";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }
    public function verAsisDocente($datos) {
        $sql = "SELECT a.*,d.idDoc,d.dniDoc,d.nomDoc,d.apepaDoc,d.apemaDoc,d.foto,d.est FROM asistencia a 
left join docente d on a.idDoc=d.idDoc where MONTH(a.fechaAsist)='{$datos['mes']}' and a.idDoc='{$datos['idDoc']}' order by a.idAsist desc";
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

    function registrar($modelo) {
        date_default_timezone_set('America/Lima');
        $hoy = date("Y-m-d");
        $conexion = new mConexion();

        $sql = "SELECT * FROM `asistencia` where fechaAsist='{$hoy}' and idDoc='{$modelo['idDoc']}';";
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        $est = 0;
        while ($dato = $rs->fetch_array()) {
            $datos = $dato;
            $est = 1;
        }
        $msj = "";
        if ($est == 0) {
            $sql = "INSERT INTO `asistencia`
        (`idDoc`,`inAsist`,`fechaAsist`)VALUES('{$modelo['idDoc']}',now(),'{$hoy}');";
            $msj = "ASISTENCIA REGISTRADA CORRECTAMENTE";
        } else if ($est == 1 && $datos['outAsist'] == null) {
            $sql = "UPDATE `asistencia` SET `outAsist` = now() WHERE `idAsist` = '{$datos['idAsist']}';";
            $msj = "SALIDA REGISTRADA CORRECTAMENTE";
        } else {
            $sql = "INSERT INTO `asistencia`
        (`idDoc`,`inAsist`,`fechaAsist`)VALUES('{$modelo['idDoc']}',now(),'{$hoy}');";
            $msj = "ASISTENCIA REGISTRADA CORRECTAMENTE";
        }

        $bd = $conexion->getBd();
        if ($bd->query($sql)) {
            
        } else {
            $msj = $bd->error;
        }
        return $msj;
    }

}
