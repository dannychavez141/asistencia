<?php
 include_once'./conexion.php'; 
$sql="SELECT * FROM docente;";

        $rs=$mysqli->query($sql);         
   while ($row = $rs ->fetch_array()) {

                  $curso[]=array_map('utf8_encode',$row);

}  
$lista=json_encode($curso,JSON_UNESCAPED_UNICODE);
header('Content-Type: application/json; charset=utf8');

        
        $rs -> close();
    


?>