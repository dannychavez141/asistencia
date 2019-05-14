<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $coduni = $_POST['coduni'];
 $nom = $_POST['nom'];
 $apepa= $_POST['apepa'];
  $apema = $_POST['apema'];
  $huella = $_POST['huella'];
$sql="UPDATE `asistencia`.`alumno` SET `nomAlu`='$nom', `apepaAlu`='$apepa', `apemaAlu`='$apemaa', `idhuella`='$huella' WHERE `codAlu`='$coduni';";
        echo $sql;
        $rs=$mysqli->query($sql);         
        $mysqli->close();
    


?>