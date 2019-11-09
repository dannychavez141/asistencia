
<?php
     //servidor, usuario de base de datos, contraseña del usuario, nombre de base de datos
	//$mysqli = new mysqli("sql307.tonohost.com","ottos_24465265","Teamarex100pre","ottos_24465265_asistencia"); 
//$mysqli = new mysqli("localhost","root","","asistencia"); 
//$mysqli = new mysqli("localhost","id11530952_proyectounu2019","losloles54","id11530952_asistencia"); 
$mysqli = new mysqli("35.238.55.2","unu2019","losloles54","asistencia"); 
	if(mysqli_connect_errno()){
		echo 'Conexion Fallida : ', mysqli_connect_error();
		exit();
	}



?>