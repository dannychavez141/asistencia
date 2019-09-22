<?php
error_reporting(0);
require 'conexion.php';
$accion = $_POST['baccion'];
    echo "go?".$accion;
    switch ($accion) {
     case 'R':
         $tcod = $_POST['tcod'];
          $tnom = $_POST['tnom'];
          $tapepa = $_POST['tapepa'];
         $tapema = $_POST['tapema'];
          $thue = $_POST['thue'];
          $test = $_POST['test'];
          
        $sql="INSERT INTO `alumno` (`codAlu`, `nomAlu`, `apepaAlu`, `apemaAlu`, `idhuella`, `est`) VALUES ('$tcod', '$tnom', '$tapepa', '$tapema', '$thue', '$test');";
        echo $sql;
  $rs=$mysqli->query($sql);
      
      header("Location: ../alumno.php?tconf=true");
        exit;
            break;

    	case 'M':
       $tcod = $_POST['tcod'];
        $tnom = $_POST['tnom'];
          $tapepa = $_POST['tapepa'];
         $tapema = $_POST['tapema'];
          $thue = $_POST['thue'];
          $test = $_POST['test'];
     $sql="UPDATE `alumno` SET `nomAlu`='$tnom', `apepaAlu`='$tapepa', `apemaAlu`='$tapema', `idhuella`='$thue', `est`='$test' WHERE `codAlu`='$tcod';";
        echo $sql;
     $rs=$mysqli->query($sql);
      header("Location: ../alumno.php?tconf=true");
       exit;
            break;
    	default:
    		# code...
    		break;
    }


?>
