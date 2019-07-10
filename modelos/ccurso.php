<?php
error_reporting(0);
require 'conexion.php';
$accion = $_POST['baccion'];
    echo "go?".$accion;
    switch ($accion) {
     case 'R':
         $nom = $_POST['nom'];
        
          
        $sql="INSERT INTO `asistencia`.`curso` (`descr`, `est`) VALUES ('$nom', '1');";
        echo $sql;
    $rs=$mysqli->query($sql);
      
      header("Location: ../curso.php?tconf=true");
        exit;
            break;
    	case 'M':
       $tcod = $_POST['tcod'];
        $tnom = $_POST['tnom'];
          $test = $_POST['test'];
     $sql="UPDATE `asistencia`.`docente` SET `nomDoc`='$tnom ', `apepaDoc`='$tapepa', `apemaDoc`='$tapema', `dni`='$tlog', `pass`='$tpass', `est`='$test' WHERE `idDocente`='$tcod';";
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