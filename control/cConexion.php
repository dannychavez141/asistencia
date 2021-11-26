<?php

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
