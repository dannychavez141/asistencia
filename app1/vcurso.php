<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $cod = $_GET['bus'];
$sql="SELECT c.idCurso,c.descr,c.est,e.descr as est FROM curso c
join estados e on c.est=e.idestados where concat(c.idCurso,c.descr) like '%".$cod."%'";

        $rs=$mysqli->query($sql);         
   while ($row = $rs ->fetch_array()) {

                  $curso[]=array_map('utf8_encode',$row);




}  echo json_encode($curso);
        
        $rs -> close();
    


?>