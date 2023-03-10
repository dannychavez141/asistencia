<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $cod = $_GET['cod'];
 $bus = $_GET['bus'];
$sql="SELECT ad.idAsignacionDoc,ad.idCurso,cu.descr as curso,d.idDocente,d.nomDoc,d.apepaDoc,d.apemaDoc,aa.idAnioAcademico,aa.descr as auni FROM asignaciondoc ad 
join curso cu on ad.idCurso=cu.idCurso
join docente d on ad.idDocente=d.idDocente
join anioacademico aa on ad.idAnioAcademico=aa.idAnioAcademico
where d.idDocente=$cod and aa.idAnioAcademico=(select idAnioAcademico from anioacademico where est=1) and concat(cu.idCurso,cu.descr) like '%$bus%';";

        $rs=$mysqli->query($sql);         
   while ($row = $rs ->fetch_array()) {

                  $curso[]=array_map('utf8_encode',$row);

}  echo json_encode($curso);
        
        $rs -> close();
    


?>