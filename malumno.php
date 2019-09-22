<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $coduni = $_POST['coduni'];
 $nom = $_POST['nom'];
 $apepa= $_POST['apepa'];
  $apema = $_POST['apema'];
  $huella = $_POST['huella'];
$sql="UPDATE `alumno` SET `nomAlu`='$nom', `apepaAlu`='$apepa', `apemaAlu`='$apema', `idhuella`='$huella' WHERE `codAlu`='$coduni';";
   
        $rs=$mysqli->query($sql);         
        $mysqli->close();
    


?>