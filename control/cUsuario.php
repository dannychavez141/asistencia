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
    function login($usuario,$clave) {
         $conexion = new cConexion();
        $sql = "SELECT * FROM docente where dni='$usuario' and  pass='$clave'";
        $bd = $conexion->getBd();
        $rs = $bd->query($sql);
        $datos=$rs->fetch_array();
        return $datos;
    }
}
