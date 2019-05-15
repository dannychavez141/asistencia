<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $cod = $_GET['bus'];
$sql="SELECT c.idClase,c.idAsignacionDoc,cu.descr as curso,d.nomDoc,d.apepaDoc,d.apemaDoc,aa.descr as auni,c.fechaClas,c.horClas,c.est,e.descr as estado FROM asistencia.clase c 
join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc 
join curso cu on ad.idCurso=cu.idCurso
join docente d on ad.idDocente=d.idDocente
join anioacademico aa on ad.idAnioAcademico=aa.idAnioAcademico
join estados e on c.est=e.idestados  where concat(cu.descr,d.nomDoc,d.apepaDoc,d.apemaDoc) like '%".$cod."%'";

        $rs=$mysqli->query($sql);         
   while ($row = $rs ->fetch_array()) {

                  $curso[]=array_map('utf8_encode',$row);

}  echo json_encode($curso);
        
        $rs -> close();
    


?>