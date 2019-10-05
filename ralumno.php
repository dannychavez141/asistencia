<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $huella = strtoupper($_POST['huella']);
 $coduni = strtoupper($_POST['coduni']);
 $nom = strtoupper($_POST['nom']);
 $apepa= strtoupper($_POST['apepa']);
  $apema = strtoupper($_POST['apema']);
$sql="INSERT INTO `alumno` VALUES ('$coduni','$nom','$apepa','$apema','$huella','1');";
echo $sql;
        $rs=$mysqli->query($sql);         
        $mysqli->close();
?>