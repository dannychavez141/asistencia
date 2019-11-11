<?php
ob_start();
 require'./conexion.php'; 
$sql="SELECT * FROM docente;";
$rs=$mysqli->query($sql);         
 while ($row = $rs ->fetch_array()) {
$curso[]=array_map('utf8_encode',$row);
}   
$rs -> close();
$mysqli->close();
header("Content-Type: application/json; charset=UTF-8");
ob_end_clean();
echo utf8_encode(json_encode($curso));
        
       
    


?>

