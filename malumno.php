<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $coduni = $_POST['coduni'];
 $nom = $_POST['nom'];
 $apepa= $_POST['apepa'];
  $apema = $_POST['apema'];
  $huella = $_POST['huella'];
  $destino="./img/temp.png";
  if (isset($_FILES["foto"]["tmp_name"]) && (is_uploaded_file($_FILES["foto"]["tmp_name"]))) {
     move_uploaded_file ($_FILES[uploadedfile][tmp_name],$destino) ;
     $imagedata = file_get_contents($destino);
$imgbase=base64_encode($imagedata);
$sql="UPDATE `alumno` SET `nomAlu`='$nom', `apepaAlu`='$apepa', `apemaAlu`='$apema', `foto`='$imgbase' WHERE `codAlu`='$coduni';";
  }else{
     $sql="UPDATE `alumno` SET `nomAlu`='$nom', `apepaAlu`='$apepa', `apemaAlu`='$apema' WHERE `codAlu`='$coduni';"; 
  }

   
        $rs=$mysqli->query($sql);         
        $mysqli->close();
    


?>