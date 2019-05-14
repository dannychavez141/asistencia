<?php error_reporting(0);

include_once'./conexion.php'; 

$sql="SELECT * from curso";
      $rs=$mysqli->query($sql);         
   while ($row = $rs ->fetch_array()) {
                  
                

echo "<p>".$row[1]."</p>" ; 
}




      ?>