<?php

class cAsistencia {

    function verAsistiencia($tipo, $cod) {

        $conexion = new cConexion();
        $sql = "SELECT * FROM asistencia ac
left join  clase c on ac.idClase=c.idClase
left join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc
left join docente d on ad.idDocente=d.idDocente
left join alumno al on ac.codAlu=al.codAlu
left join curso cu on ad.idCurso=cu.idCurso
left join aula a on c.idAula =a.idAula ";
        if ($tipo == 1) {
            $sql .= "where ac.idClase='$cod'";
        } else if ($tipo == 2) {
            $sql .= "where ac.codAlu='$cod'";
        }
        
//  echo $sql;
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        $datos = $rs->fetch_array();
        return $datos;
    }

    function registrar($modelo) {
        $conexion = new cConexion();
        $sql = "INSERT INTO `asistencia`
(`idClase`,
`codAlu`,
`fMarca`)
VALUES
('{$modelo['idClase']}',
'{$modelo['codAlu']}',
'{$modelo['fMarca']}');";
        $msj = "";
        $bd = $conexion->getBd();
        if ($bd->query($sql)) {
            $msj = "ASISTENCIA REGISTRADA CORRECTAMENTE";
        } else {
            $msj = $bd->error;
        }
        return $msj;
    }

}
