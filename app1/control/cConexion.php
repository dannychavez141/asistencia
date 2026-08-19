<?php

class cConexion {

    private $bd;

    function __construct() {
       // $this->bd = new mysqli("localhost", "i7982532_wp1", "I.dcZ3MfCiwJYzpvmgL50", "i7982532_wp1");
$this->bd = new mysqli("localhost", "root", "root", "asistenciaunu");
        if ($this->bd->connect_errno) {
            echo 'error al conectar:';
            echo 'error' . $this->bd->connect_error;
        } else {
            $this->bd->set_charset("utf8mb4");
        }
    }

    function getBd() {
        return $this->bd;
    }

    function setBd($bd): void {
        $this->bd = $bd;
    }

}
