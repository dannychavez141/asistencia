<?php
  include_once'./conexion.php'; 

    $conn = $mysqli;
      if($conn->connect_error){
        die("Conexión fallida: ".$conn->connect_error);
      }

    $salida = "";

    $query = "SELECT c.idClase,c.idAsignacionDoc,cu.descr as curso,d.nomDoc,d.apepaDoc,d.apemaDoc,aa.descr as auni,c.fechaClas,c.horClas,c.est,e.descr as estado FROM clase c 
join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc 
join curso cu on ad.idCurso=cu.idCurso
join docente d on ad.idDocente=d.idDocente
join anioacademico aa on ad.idAnioAcademico=aa.idAnioAcademico
join estados e on c.est=e.idestados  where concat(cu.descr,d.nomDoc,d.apepaDoc,d.apemaDoc,c.fechaClas,c.horClas) like '%%' ORDER BY c.idClase Desc";

    if (isset($_POST['consulta'])) {
        $q = $conn->real_escape_string($_POST['consulta']);
        $query = "SELECT c.idClase,c.idAsignacionDoc,cu.descr as curso,d.nomDoc,d.apepaDoc,d.apemaDoc,aa.descr as auni,c.fechaClas,c.horClas,c.est,e.descr as estado FROM clase c 
join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc 
join curso cu on ad.idCurso=cu.idCurso
join docente d on ad.idDocente=d.idDocente
join anioacademico aa on ad.idAnioAcademico=aa.idAnioAcademico
join estados e on c.est=e.idestados  where concat(cu.descr,d.nomDoc,d.apepaDoc,d.apemaDoc,c.fechaClas,c.horClas) like '%$q%' ORDER BY c.idClase Desc;";
    }

    $resultado = $conn->query($query);


    if ($resultado->num_rows>0) {
       

        $salida.="<table border=1 class='tabla_datos'>
                <thead>
                    <tr id='titulo'>
                        <td>Codigo</td>
                        <td>Curso </td>
                        <td>Docente</td>
                        <td>Año Universitario</td>
                        <td>Fecha de clase</td>
                        <td>Hora Inicio</td>
                         <td>Estado</td>
                         <td>Ver Asistencia</td>
                        
                    </tr>

                </thead>
                

        <tbody>";

        while ($fila = $resultado->fetch_array()) {
              

            $salida.="<tr>
                        <td>".$fila[0]."</td>
                        <td>".$fila[2]."</td>
                        <td>".$fila[4]." ".$fila[5]." ".$fila[3]."</td>
                        <td>".$fila[6]."</td>
                        <td>".$fila[7]."</td>
                        <td>".$fila[8]."</td>
                        <td>".$fila[10]."</td>
                         <td><a href='asistencia.php?cod=".$fila[0]."' ><img src='images/deta.png' width='30' height='30'></a></td>
                        </tr>";

        }
        $salida.="</tbody></table>";
    }else{
        $salida.="NO HAY DATOS :(";
    }


    echo $salida;

    $conn->close();



?>