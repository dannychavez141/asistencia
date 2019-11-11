<?php
error_reporting(0);
 include_once'./conexion.php'; 
$sql="SELECT * FROM docente;";

        $rs=$mysqli->query($sql);         
   while ($row = $rs ->fetch_array()) {

                  $curso[]=array_map('utf8_encode',$row);

} header('Content-type=application/json; charset=utf-8');
 echo json_encode($curso);
        
        $rs -> close();
    


?>