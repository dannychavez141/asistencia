<?php

class mMetodos {

    function ejecutar($sql, $msj) {
        // echo $sql;
        $conexion = new mConexion();
        $bd = $conexion->getBd();
        $resp=array();
        if ($bd->query($sql)) {
            $resp['msj']=$msj;
             $resp['est']='success';
          
        } else {
            
             $resp['msj']=mysqli_error($bd);
             $resp['est']='error';
        }
        return $resp;
    }

    function consultar($sql) {
        $conexion = new mConexion();
        $bd = $conexion->getBd();
        // print_r($sql);
        $datos = array();
        $respuesta = $bd->query($sql);
        if (!empty($respuesta) && mysqli_num_rows($respuesta) > 0) {
            while ($dato = mysqli_fetch_array($respuesta)) {
                $datos[] = array_map('utf8_encode', $dato);
            }
        }
        $datosAjax = json_encode($datos);
        return $datosAjax;
    }


}
