<?php
error_reporting(0);

$mysqli = new mysqli("localhost", "root", "", "asistencia");
if ($mysqli->connect_errno) {
    echo 'error al conectar';
    echo 'error' . $mysqli->connect_errno;
}else
{
  
}

?>