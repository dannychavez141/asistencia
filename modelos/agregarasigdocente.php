<?php 
error_reporting(0);
require 'conexion.php';
 $anio = $_GET['anio']; 
 $doc = $_GET['doc'];
 $cur = $_POST['cur']; 

          
        $sql="INSERT INTO `asignaciondoc` (`idCurso`, `idDocente`, `idAnioAcademico`, `est`) VALUES ('$cur', '$doc', '$anio', '1');";
        echo $sql;
  $rs=$mysqli->query($sql);
      
     header("Location: ../cursodocente.php?tconf=true&&cod=$doc&&anio=$anio");
        exit;
 ?>