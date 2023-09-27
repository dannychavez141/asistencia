<?php

class cDocente {

    public $metodos;

    public function __construct() {
        $this->metodos = new mMetodos();
    }

    public function verTodos($datos) {
      //  $sql = "SELECT `idDoc`, `dniDoc`, `claveDoc`, `nomDoc`, `apepaDoc`, `apemaDoc`,foto, `est`,`idgAcademico` FROM `docente` WHERE  concat(dniDoc,' ',nomDoc,' ',apepaDoc,' ',apemaDoc) like '%{$datos['busq']}%' limit 20;";
       $sql = "SELECT `idDoc`, `dniDoc`, `claveDoc`, `nomDoc`, `apepaDoc`, `apemaDoc`, `est`,`idgAcademico` FROM `docente` WHERE  concat(dniDoc,' ',nomDoc,' ',apepaDoc,' ',apemaDoc) like '%{$datos['busq']}%' limit 20;";
     
//echo $sql;
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }
     public function verTodosaApp() {
        $sql = "SELECT `idDoc`, `dniDoc`, `nomDoc`, `apepaDoc`, `apemaDoc`,imghuella1,imghuella2,foto FROM `docente` WHERE est=1 ;";
      //echo $sql;
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function verUno($datos) {
        $sql = "SELECT * FROM `docente` WHERE  idDoc='{$datos['idDoc']}'";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }

    public function verUnoReg($datos) {
        $sql = "SELECT * FROM `docente` WHERE  dniDoc='{$datos['dniDoc']}'";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }
    public function crear($datos) {
        $sql = "INSERT INTO `docente`(`dniDoc`,`claveDoc`,`nomDoc`,`apepaDoc`,`apemaDoc`,`foto`,`est`) VALUES 
('{$datos['dniDoc']}','{$datos['claveDoc']}','{$datos['nomDoc']}','{$datos['apepaDoc']}','{$datos['apemaDoc']}','{$datos['foto']}','{$datos['est']}');";
        $resp = $this->metodos->ejecutar($sql,"REGISTRADO CORRECTAMENTE");
        return $resp;
    }

    public function modificar($datos) {
        $sql = "UPDATE `docente` SET "
                . "`dniDoc`='{$datos['dniDoc']}',"
                . "`claveDoc`='{$datos['claveDoc']}',"
                . "`nomDoc`='{$datos['nomDoc']}',"
                . "`apepaDoc`='{$datos['apepaDoc']}',"
                . "`apemaDoc`='{$datos['apemaDoc']}',"
                . "`foto`='{$datos['foto']}',"
                . "`est`='{$datos['est']}' "
                . "WHERE `idDoc`='{$datos['idDoc']}'";
        $resp = $this->metodos->ejecutar($sql,"MODIFICADO CORRECTAMENTE");
        return $resp;
    }

    function AgregarHuellas($id, $huella1, $huella2) {
        $sql = "UPDATE `docente` SET `imghuella1` = '{$huella1}', `imghuella2` = '{$huella2}' WHERE (`idDoc` = '{$id}');";
        //echo $sql;
        $resp = $this->metodos->ejecutar($sql, "correcto");
        return $resp;
    }

}
