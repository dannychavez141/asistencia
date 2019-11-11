
<?php
     //servidor, usuario de base de datos, contraseña del usuario, nombre de base de datos
<<<<<<< HEAD
	//$mysqli = new mysqli("localhost","root","","asistencia"); 
$mysqli = new mysqli("sql202.epizy.com","epiz_24776534","lQIE6dbtPgq","epiz_24776534_asistencia"); 
//
//
=======
	//$mysqli = new mysqli("sql307.tonohost.com","ottos_24465265","Teamarex100pre","ottos_24465265_asistencia"); 
//$mysqli = new mysqli("localhost","root","","asistencia"); 
//$mysqli = new mysqli("localhost","id11530952_proyectounu2019","losloles54","id11530952_asistencia"); 
$mysqli = new mysqli("35.238.55.2","unu2019","losloles54","asistencia"); 
>>>>>>> 7b8f917042c8e9cd2195be0293eff088885af18a
	if(mysqli_connect_errno()){
		echo 'Conexion Fallida : ', mysqli_connect_error();
		exit();
	}
?>