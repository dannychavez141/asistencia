<?php

error_reporting(0);
include_once'./conexion.php';
$bus = $_GET['bus'];
$sql = "select a.codAlu,a.nomAlu,a.apepaAlu,a.apemaAlu,a.est,e.descr from alumno a 
join estados e on a.est=e.idestados  where concat(a.nomAlu,a.apepaAlu,a.apemaAlu,a.codAlu) like '%$bus%'";

$rs = $mysqli->query($sql);
while ($row = $rs->fetch_array()) {

    $alumno[] = array_map('utf8_encode', $row);
} echo json_encode($alumno);

$rs->close();
?>