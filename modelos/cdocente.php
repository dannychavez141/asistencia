<?php
//error_reporting(0);
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
          
        $sql="INSERT INTO `bdcontrolcomedor`.`usuario`(`idUsuario`,`NombreUsu`,`ApepaUsu`,`ApemaUsu`,`Login`,`Pass`)VALUES(null,'$tnom','$tapepa','$tapema','$tlog','$tpass');";
        echo $sql;
     // $rs=$mysqli->query($sql);
      
      header("Location: docente.php?tconf=true");
        exit;
            break;

    	case 'M':
       $tcod = $_POST['tcod'];
        $tnom = $_POST['tnom'];
          $tapepa = $_POST['tapepa'];
         $tapema = $_POST['tapema'];
          $tlog = $_POST['tlog'];
          $tpass = $_POST['tpass'];
     $sql="UPDATE `bdcontrolcomedor`.`usuario` SET `NombreUsu` = '$tnom', `ApepaUsu` ='$tapepa' ,`ApemaUsu` = '$tapema',`Login` = '$tlog',`Pass` = '$tpass' WHERE `idUsuario` = $tcod;";
        echo $sql;
       // $rs=$mysqli->query($sql);
       header("Location: $Path./docente.php?tconf=true");
       exit;
            break;
    	default:
    		# code...
    		break;
    }


?>