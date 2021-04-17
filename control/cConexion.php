<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of cConexion
 *
 * @author DaHex2
 */
class cConexion {

    private $bd;

    function __construct() {
        $this->bd = new mysqli("localhost", "root", "", "asistencia");

        if ($this->bd->connect_errno) {
            echo 'error al conectar:';
            echo 'error' . $this->bd->connect_error;
        }
    }

    function getBd() {
        return $this->bd;
    }

    function setBd($bd): void {
        $this->bd = $bd;
    }

}
