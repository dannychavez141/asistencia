<?php
ob_start();
 require'./conexion.php'; 
$sql="SELECT * FROM docente;";
$rs=$mysqli->query($sql);         
 while ($row = $rs ->fetch_array()) {
$curso[]=$row;
}   
$rs -> close();
$mysqli->close();
header("Content-Type: application/json; charset=UTF-8");
ob_end_clean();
echo json_encode($curso);
        
       
    


?>

