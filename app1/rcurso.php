<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $descr = $_POST['desr'];
 $iddoc = $_POST['iddoc'];
$sql="INSERT INTO `asistencia`.`curso` VALUES(null,'$descr',1);";

        $rs=$mysqli->query($sql);         
   
$sql="select * from curso order by idCurso desc limit 1;";

        $rs=$mysqli->query($sql);         
   while ($row = $rs ->fetch_array()) {

        $idcurso=$row[0];         


} 
$rs -> close();

$sql="select idAnioAcademico from anioacademico where est=1;";
 $rs=$mysqli->query($sql);         
   while ($row = $rs ->fetch_array()) {

        $idauni=$row[0];         

} 
$rs -> close();

$sql="INSERT INTO `asignaciondoc` (`idCurso`, `idDocente`, `idAnioAcademico`) VALUES ('$idcurso', '$iddoc', ' $idauni');";

        $rs=$mysqli->query($sql);  
        $mysqli->close();
    
?>