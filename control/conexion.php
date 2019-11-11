
<?php
     //servidor, usuario de base de datos, contraseña del usuario, nombre de base de datos
	//$mysqli = new mysqli("localhost","root","","asistencia"); 
$mysqli = new mysqli("sql202.epizy.com","epiz_24776534","lQIE6dbtPgq","epiz_24776534_asistencia"); 
//
//
	if(mysqli_connect_errno()){
		echo 'Conexion Fallida : ', mysqli_connect_error();
		exit();
	}
?>