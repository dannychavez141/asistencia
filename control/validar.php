<?php
include('conexion.php');
if (isset($_POST['login'])) {
	//VARIABLES DEL USUARIO
$usuario = $_POST['txtusuario'];
$pass = $_POST['txtpass'];
//VALIDAR CONTENIDO EN LAS VARIABLES O CAJAS DE TEXTO
if (empty($usuario) | empty($pass)) 
	{
	header("Location: ../index.php");
	exit();
	}
//VALIDANDO EXISTENCIA DEL USUARIO
$sql = $mysqli->query("SELECT * FROM `usuario` where Login = '$usuario' and Pass = '$pass' ");

if ($row = $sql->fetch_array()) 
		{
		session_start();
		$_SESSION['usuario'] = $row[2].' '.$row[3].' '.$row[1];
		$_SESSION['idUsuario'] = $row[0];
		header("Location: ../index.php");
		}else
			{ 
			header("Location: ../login.php?msj=true");
			exit();
		}
}
?>