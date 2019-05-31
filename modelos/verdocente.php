<?php
error_reporting(0);
 include_once'./conexion.php'; 
function buscar($bus)
{
 $sql="SELECT * FROM asistencia.docente where concat(idDocente,nomDoc,apepaDoc,apemaDoc,dni) like '%".$bus."%';";

   


    return  $sql;
}

?>