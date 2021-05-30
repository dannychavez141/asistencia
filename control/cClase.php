<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of cClase
 *
 * @author DaHex2
 */
class cClase {

    function verClasesDocente($id) {

        $conexion = new cConexion();
        $sql = " SELECT * FROM  clase c
left join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc
left join docente d on ad.idDocente=d.idDocente
left join curso cu on ad.idCurso=cu.idCurso
left join aula a on c.idAula =a.idAula where ad.idCurso='$id' order by c.fechaClas desc";
        //  echo $sql;
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        $datos = array();
        while ($dato = $rs->fetch_array()) {
            $datos[] = $dato;
        }
        return $datos;
    }

    function verUnaClase($id) {

        $conexion = new cConexion();
        $sql = "SELECT * FROM  clase c
left join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc
left join docente d on ad.idDocente=d.idDocente
left join curso cu on ad.idCurso=cu.idCurso
left join aula a on c.idAula =a.idAula where c.idClase='$id'";
        //  echo $sql;
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        $datos = $rs->fetch_array();
        return $datos;
    }

    function registrar($modelo) {

        $conexion = new cConexion();
        $sql = "INSERT INTO `clase`
(`idAsignacionDoc`,`idAula`,`fechaClas`,`horClas`,`cierre`,`est`) VALUES 
('{$modelo['idAsignacionDoc']}',
'{$modelo['idAula']}',
'{$modelo['fechaClas']}',
'{$modelo['horClas']}',
'{$modelo['cierre']}',
'{$modelo['est']}');";
        $msj = "";
        $bd = $conexion->getBd();
        if ($bd->query($sql)) {
            $msj = "CLASE CREADA CORRECTAMENTE";
        } else {
            $msj = $bd->error;
        }
        return $msj;
    }

    function modificar($curso, $anio) {
        $conexion = new cConexion();
        $sql = "UPDATE `clase` SET
`idAsignacionDoc` = '{$modelo['idAsignacionDoc']}',
`idAula` = '{$modelo['idAula']}',
`fechaClas` = '{$modelo['fechaClas']}',
`horClas` = '{$modelo['horClas']}',
`cierre` = '{$modelo['cierre']}',
`est` = '{$modelo['est']}'
WHERE `idClase` = '{$modelo['idClase']}';
";
        $msj = "";
        $bd = $conexion->getBd();
        if ($bd->query($sql)) {
            $msj = "CLASE MODIFICADA CORRECTAMENTE";
        } else {
            $msj = $bd->error;
        }

        return $msj;
    }

}
