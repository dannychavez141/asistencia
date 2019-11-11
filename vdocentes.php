<?php
 include_once'./conexion.php'; 
$sql="SELECT * FROM docente;";

        $rs=$mysqli->query($sql);         
   while ($row = $rs ->fetch_array()) {

                  $curso[]=array_map('utf8_encode',$row);

<<<<<<< HEAD
} header('Content-type=application/json; charset=utf-8');
 echo json_encode($curso);
=======
}  
$lista=json_encode($curso,JSON_UNESCAPED_UNICODE);
header('Content-Type: application/json; charset=utf8');
echo $lista;
>>>>>>> 7b8f917042c8e9cd2195be0293eff088885af18a
        
        $rs -> close();
    


?>