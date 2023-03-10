<?php
error_reporting(0);
require 'conexion.php';
$accion = $_POST['baccion'];
    echo "go?".$accion;
    switch ($accion) {
    	case 'M':
       $tcod = $_POST['tcod'];
        $tfec = $_POST['tfec'];
          $thor = $_POST['thor'];
       $test = $_POST['test'];
     $sql="UPDATE `clase` SET `fechaClas`='$tfec', `horClas`='$thor', `est`='$test' WHERE `idClase`='$tcod';";
        echo $sql;
      $rs=$mysqli->query($sql);
       header("Location: ../clase.php?tconf=true");
       exit;
            break;
    	default:
    		# code...
    		break;
    }


?>