<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $huella = $_POST['huella'];
 $coduni = $_POST['coduni'];
 $nom = $_POST['nom'];
 $apepa= $_POST['apepa'];
  $apema = $_POST['apema'];
$sql="INSERT INTO `alumno` VALUES ('$coduni','$nom','$apepa','$apema','$huella','1');";
echo $sql;
        $rs=$mysqli->query($sql);         
        $mysqli->close();
?>