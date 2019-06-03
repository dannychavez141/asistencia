<?php
error_reporting(0);
require 'conexion.php';
$accion = $_POST['baccion'];
    echo "go?".$accion;
    switch ($accion) {
     case 'R':
         $tnom = $_POST['tnom'];
          $tapepa = $_POST['tapepa'];
         $tapema = $_POST['tapema'];
          $tlog = $_POST['tlog'];
          $tpass = $_POST['tpass'];
          
        $sql="INSERT INTO `asistencia`.`docente` (`nomDoc`, `apepaDoc`, `apemaDoc`, `dni`, `pass`, `est`) VALUES ('$tnom', '$tapepa', '$tapema', '$tlog', '$tpass', '1');";
        echo $sql;
    $rs=$mysqli->query($sql);
      
      header("Location: ../docente.php?tconf=true");
        exit;
            break;

    	case 'M':
       $tcod = $_POST['tcod'];
        $tnom = $_POST['tnom'];
          $tapepa = $_POST['tapepa'];
         $tapema = $_POST['tapema'];
          $tlog = $_POST['tlog'];
          $tpass = $_POST['tpass'];
          $test = $_POST['test'];
     $sql="UPDATE `asistencia`.`docente` SET `nomDoc`='$tnom ', `apepaDoc`='$tapepa', `apemaDoc`='$tapema', `dni`='$tlog', `pass`='$tpass', `est`='$test' WHERE `idDocente`='$tcod';";
        echo $sql;
      $rs=$mysqli->query($sql);
       header("Location: ../docente.php?tconf=true");
       exit;
            break;
    	default:
    		# code...
    		break;
    }


?>