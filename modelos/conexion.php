<?php
//$mysqli = new mysqli("localhost", "root", "", "asistencia");
$mysqli = new mysqli("sql202.epizy.com","epiz_24776534","lQIE6dbtPgq","epiz_24776534_asistencia"); 
if ($mysqli->connect_errno) {
    echo 'error al conectar';
    echo 'error' . $mysqli->connect_errno;
}else
{
  
}

?>