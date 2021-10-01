<?php 
error_reporting(0);
require 'conexion.php';
 $anio = $_GET['anio']; 
 $doc = $_GET['doc'];
 $cur = $_POST['cur']; 
 $aula = $_POST['aula']; 
          
        $sql="INSERT INTO `asignaciondoc` (`idCurso`, `idDocente`, `idAnioAcademico`, `idAula`, `est`) VALUES ('$cur', '$doc', '$anio','$aula', '1');";
        echo $sql;
  $mysqli->query($sql);
      
     header("Location: ../cursodocente.php?tconf=true&&cod=$doc&&anio=$anio");
        exit;
 ?>