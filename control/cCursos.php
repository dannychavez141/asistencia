<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of cCursos
 *
 * @author DaHex2
 */
class cCursos {

    function verAlumnosCurso($curso) {

        $conexion = new cConexion();
        $sql = " SELECT * FROM asignacionalu  aa
inner join alumno a on aa.codAlu=a.codAlu
inner join curso c on aa.idCurso=c.idCurso
inner join anioacademico aac on aa.idAnioAcademico=aac.idAnioAcademico
where aa.idCurso='$curso' and aa.est='1' order by a.apepaAlu;";
        //  echo $sql;
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        $datos = array();
        while ($dato = $rs->fetch_array()) {
            $datos[] = $dato;
        }
        return $datos;
    }

    function verUno($cod) {
        $conexion = new cConexion();
        $sql = "SELECT * FROM asignaciondoc  ad
inner join curso c on ad.idCurso=c.idCurso
inner join docente d on ad.idDocente=d.idDocente
inner join anioacademico aa on ad.idAnioAcademico=aa.idAnioAcademico
where ad.idDocente='$cod' and aa.est='1';";
        //  echo $sql;
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        $datos = array();
        while ($dato = $rs->fetch_array()) {
            $datos[] = $dato;
        }
        return $datos;
    }

    function Crear($datos) {
        
    }

    function Editar($datos) {
        
    }

    function Eliminar($cod) {
        
    }

}
