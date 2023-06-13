<?php

class mMetodos {

    public $conexion;

    public function __construct() {
        $this->conexion = new mConexion();
    }

    function ejecutar($sql, $msj) {
        // echo $sql;

        $bd = $this->conexion->getBd();
        $resp = array();
        if ($bd->query($sql)) {
            $resp['msj'] = $msj;
            $resp['est'] = 'success';
        } else {

            $resp['msj'] = mysqli_error($bd);
            $resp['est'] = 'error';
        }
        return $resp;
    }

    function consultar($sql) {
        //print_r($sql);
        $bd = $this->conexion->getBd();
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
    
     function consultarArray($sql) {
      $bd = $this->conexion->getBd();
        //print_r($sql);
        $datos = array();
        $respuesta = $bd->query($sql);
        if (!empty($respuesta) && mysqli_num_rows($respuesta) > 0) {
            while ($dato = mysqli_fetch_array($respuesta)) {
              $datos[] = array_map('utf8_encode', $dato);
                // print_r($dato);
            }
        }
        //print_r($datos);
        return $datos;
    }

}
