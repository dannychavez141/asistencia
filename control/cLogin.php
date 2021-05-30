<?php

class cLogin {

    function login($datos) {
        $conexion = new cConexion();
        $bd = $conexion->getBd();
        $sql = "SELECT `docente`.`idDocente`,
    `docente`.`nomDoc`,
    `docente`.`apepaDoc`,
    `docente`.`apemaDoc`,
    `docente`.`dni`,
    `docente`.`est`
FROM `docente` where dni='{$datos['user']}' and pass='{$datos['pass']}'";
        $respuesta = $bd->query($sql);
        if (mysqli_num_rows($respuesta) > 0) {
            $dato = mysqli_fetch_array($respuesta);
            //print_r($dato);
        } else {
            $dato = array();
        }
        return $dato;
    }

    function crearToken($datos) {
        $jmt = new \Firebase\JWT\JWT();
        $tiempo = 1; // Horas
        $time = time();
        $encrypt = array('HS256');
        $apellidos=$datos['apepaDoc'].' '.$datos['apemaDoc'];
        $token = array(
            'exp' => $time + (3600 * $tiempo),
            'aud' => array(
                'id' => "{$datos['idDocente']}"
            ),
            'data' => array(
                'nombres' => "{$datos['nomDoc']}",
                'apellidos' => "$apellidos",
                'usuario' => "docente "
            )
        );
        $t = $jmt->encode($token, "1234");
        return $t;
    }

    function validar($token) {
        $jmt = new \Firebase\JWT\JWT();
        $encrypt = array('HS256');
        $e = $jmt->decode($token, "1234", $encrypt);
        return $e;
    }

}
