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

    function Crear($id,$huella1,$huella2,$codhuella1,$codehuella2) {
        
        $conexion = new cConexion();
        $sql = "";
        //echo $sql;
        $bd = $conexion->getBd();
       if($bd->query($sql)){
           
       }
    }

    function Editar($datos) {
        
    }

    function Eliminar($cod) {
        
    }
    function AlumnosCurso($curso,$anio) {
        
    }
 function AgregarHuellas($id,$huella1,$huella2,$codhuella1,$codehuella2) {
        
        $conexion = new cConexion();
        $sql = "UPDATE `alumno` SET `huella1` = '$huella1', `huella2` = '$huella2', `imghuella1` = '$codhuella1', `imghuella2` = '$codehuella2' WHERE (`codAlu` = '$id');";
        //echo $sql;
        $bd = $conexion->getBd();
        $resp=array();
        if($bd->query($sql)){
          $resp['est']="ok";
          $resp['msj']="Todo good";
       }else{
           $resp['est']="error";
          $resp['msj']= $bd->error;;
       }
       return $resp;
    }
}
