<?php

class cConexion {

    private $bd;

    function __construct() {
        $this->bd = new mysqli("localhost", "i7982532_wp1", "I.dcZ3MfCiwJYzpvmgL50", "i7982532_wp1");

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
