<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of cUsuario
 *
 * @author DaHex2
 */
class cUsuario {

    function login($usuario, $clave) {
        $conexion = new cConexion();
        $sql = "SELECT * FROM docente where dni='$usuario' and  pass='$clave'";
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        $datos = $rs->fetch_array();
        return $datos;
    }

    function crearToken($datos) {
        $jmt = new \Firebase\JWT\JWT();
        $tiempo = 1; // Horas
        $time = time();
        $encrypt = array('HS256');
        $token = array(
            'exp' => $time + (3600 * $tiempo),
            'aud' => array(
                'id' => "{$datos['idusuario']}"
            ),
            'data' => array(
                'nombres' => "{$datos['nombres']}",
                'apellidos' => "{$datos['apellidos']}",
                'usuario' => "{$datos['user']}"
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
