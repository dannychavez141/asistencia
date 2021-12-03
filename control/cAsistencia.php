<?php

class cAsistencia {

    function verAsistiencia($tipo, $cod,$busq) {

        $conexion = new cConexion();
        $sql = "SELECT ac.idClase,ac.codAlu,concat(al.nomAlu,' ',al.apepaAlu,' ',al.apemaAlu) as alumno,if(ac.entrada is null,'SIN REGISTRO',ac.entrada) as entrada,if(ac.salida is null,'SIN REGISTRO',ac.salida) as salida FROM asistencia ac
left join clase c on ac.idClase=c.idClase
left join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc
left join docente d on ad.idDocente=d.idDocente
left join alumno al on ac.codAlu=al.codAlu
left join curso cu on ad.idCurso=cu.idCurso
left join aula a on ad.idAula =a.idaula ";
        if ($tipo == 1) {
            $sql .= "where ac.idClase='$cod' and concat(al.codAlu,al.nomAlu,al.apepaAlu,al.apemaAlu) like '%$busq%' order by al.codAlu desc";
        } else if ($tipo == 2) {
            $sql .= "where al.codAlu='$cod'";
        }
        
  //echo $sql;
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        $datos=array();
       while ($dato = $rs->fetch_array()) {
            $datos[] = $dato;
        }
        return $datos;
    }

    function registrar($modelo) {
        $conexion = new cConexion();
        
$sql="SELECT * FROM `asistencia` where idClase='{$modelo['idClase']}' and codAlu='{$modelo['codAlu']}';";
        
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        $est=0;
       while ($dato = $rs->fetch_array()) {
            $datos = $dato;
        } 
        
        $sql = "INSERT INTO `asistencia`
(`idClase`,`codAlu`,`fMarca`)VALUES('{$modelo['idClase']}','{$modelo['codAlu']}',current_time());";
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
