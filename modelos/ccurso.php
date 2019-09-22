<?php
error_reporting(0);
require 'conexion.php';
$accion = $_POST['baccion'];
    echo "go?".$accion;
    switch ($accion) {
     case 'R':
         $nom = $_POST['tnom'];
        $test = $_POST['test'];
          
        $sql="INSERT INTO `curso` (`descr`, `est`) VALUES ('$nom', '$test');";
        echo $sql;
    $rs=$mysqli->query($sql);
      
      header("Location: ../curso.php?tconf=true");
        exit;
            break;
    	case 'M':
       $tcod = $_POST['tcod'];
        $tnom = $_POST['tnom'];
          $test = $_POST['test'];
     $sql="UPDATE `curso` SET `descr`='$tnom', `est`='$test' WHERE `idCurso`='$tcod';
";
        echo $sql;
      $rs=$mysqli->query($sql);
       header("Location: ../curso.php?tconf=true");
       exit;
            break;
    	default:
    		# code...
    		break;
    }


?>