<?php

class cHorario {

    public $metodos;

    public function __construct() {
        $this->metodos = new mMetodos();
    }
      public function verUno($datos) {
        $sql = "SELECT d.*,h.*,doc.dniDoc,doc.nomDoc,doc.apepaDoc,doc.apemaDoc FROM horario h
left join dia d on h.idDia=d.idDia
left join docente doc on h.idDoc=doc.idDoc where h.idDoc='{$datos['idDoc']}'";
        $resp = $this->metodos->consultar($sql);
        return $resp;
    }
    public function crear($datos) {
        $sql = "INSERT INTO `horario`
(`idDoc`,`idDia`,`hEntrada`,`hSalida`,`idEst`)VALUES
('{$datos['idDoc']}','{$datos['idDia']}','{$datos['hEntrada']}','{$datos['hSalida']}','{$datos['idEst']}');";
        $resp = $this->metodos->ejecutar($sql,"REGISTRADO CORRECTAMENTE");
        return $resp;
    }

    public function modificar($datos) {
        $sql = "UPDATE `horario` SET "
                . "`idDoc`='{$datos['idDoc']}',"
                . "`idDia`='{$datos['idDia']}',"
                . "`hEntrada`='{$datos['hEntrada']}',"
                . "`hSalida`='{$datos['hSalida']}',"
                . "`apemaDoc`='{$datos['apemaDoc']}',"
                . "`foto`='{$datos['foto']}',"
                . "`est`='{$datos['est']}' "
                . "WHERE `idDoc`='{$datos['idDoc']}'";
        $resp = $this->metodos->ejecutar($sql,"MODIFICADO CORRECTAMENTE");
        return $resp;
    }


}
