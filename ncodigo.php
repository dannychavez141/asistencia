<?php
error_reporting(0);
 include_once'./conexion.php'; 
 
$sql="SELECT max(idhuella)+1 from alumno  limit 1";
 $rs=$mysqli->query($sql);         
   while ($row = $rs ->fetch_array()) {

                  $alumno[]=array_map('utf8_encode',$row);


}  echo json_encode($alumno);
        
        $rs -> close();
    


?>