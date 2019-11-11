<?php
//$mysqli = new mysqli("localhost", "root", "", "asistencia");
//$mysqli = new mysqli("localhost", "root", "", "asistencia");
//$mysqli = new mysqli("sql307.tonohost.com","ottos_24465265","Teamarex100pre","ottos_24465265_asistencia"); 
//$mysqli = new mysqli("localhost","id11530952_proyectounu2019","losloles54","id11530952_asistencia"); 
//$mysqli = new mysqli("35.238.55.2","unu2019","losloles54","asistencia"); 
$mysqli = new mysqli("sql202.epizy.com","epiz_24776534","lQIE6dbtPgq","epiz_24776534_asistencia"); 

if ($mysqli->connect_errno) {
    echo 'error al conectar:';
    echo 'error' . $mysqli->connect_errno;
}

?>