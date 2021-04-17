<?php

class cAlumno {

    function verTodos($busq) {
        $conexion = new cConexion();
        $sql = "SELECT * FROM alumno where concat(nomAlu,' ',apepaAlu,' ',apemaAlu) like '%$busq%';";
        //echo $sql;
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
        $sql = "SELECT * FROM alumno where  codAlu='$cod';";
        //echo $sql;
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
