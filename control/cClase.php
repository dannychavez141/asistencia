<?php

class cClase {

    function verClasesDocente($id) {

        $conexion = new cConexion();
        $sql = "SELECT * FROM  clase c
left join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc
left join docente d on ad.idDocente=d.idDocente
left join curso cu on ad.idCurso=cu.idCurso
left join aula a on ad.idAula =a.idaula  where ad.idAsignacionDoc='$id' order by c.fechaClas desc";
        //   echo $sql;
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
left join aula a on ad.idAula =a.idaula where c.idClase='$id'";
        //  echo $sql;
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        while ($dato = $rs->fetch_array()) {
            $datos[] = $dato;
        }
        return $datos;
    }

    function verUClaseAula($id) {

        $conexion = new cConexion();
        $sql = "SELECT * FROM  clase c
left join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc
left join docente d on ad.idDocente=d.idDocente
left join curso cu on ad.idCurso=cu.idCurso
inner join anioacademico aac on ad.idAnioAcademico=aac.idAnioAcademico
left join aula a on ad.idAula =a.idaula where ad.idAula='$id' and c.fechaClas=curdate()  and c.horClas < current_time() and cierre > current_time() and c.est=1";
        //  echo $sql;
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        while ($dato = $rs->fetch_array()) {
            $datos[] = $dato;
        }
        return $datos;
    }

    function registrar($modelo) {

        $conexion = new cConexion();
        $sql = "INSERT INTO `clase`
(`idAsignacionDoc`,`fechaClas`,`horClas`,`cierre`,`est`) VALUES 
('{$modelo['idAsignacionDoc']}','{$modelo['fechaClas']}','{$modelo['horClas']}','{$modelo['cierre']}','1');";
//echo $sql;
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
