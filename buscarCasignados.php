<?php
  include_once'./conexion.php'; 

    $conn = $mysqli;
      if($conn->connect_error){
        die("Conexión fallida: ".$conn->connect_error);
      }
      $idanio=$_POST['anio'];
      $doc=$_POST['doc'];

    $salida = "";

    $query = "SELECT * FROM asignaciondoc a join curso c on a.idCurso=c.idCurso join anioacademico au on a.idAnioAcademico=au.idAnioAcademico where  a.idDocente=$doc and a.idAnioAcademico=$idanio ;";


    $resultado = $conn->query($query);


    if ($resultado->num_rows>0) {
       

        $salida.="<table border=1 class='tabla_datos'>
                <thead>
                    <tr id='titulo'>
                        <td> CURSOS</td>
                        <td>ESCTADO</td>
                        <td>VER ASISTENCIAS</td>
                        <td>VER ESTADISTICA</td>
                    </tr>

                </thead>    

        <tbody>";

        while ($fila = $resultado->fetch_array()) {
              if($fila[4]==1){
    $estado="Activo";
 }else {$estado="Inactivo";}

            $salida.="<tr align='center'>
                       
                        <td>".$fila[6]."</td>
                        
                        <td>".$estado."</td>
                        <td><a href='listaasistencia.php?anio=".$idanio."&&cur=".$fila[1]."&&cod=".$doc."' ><img src='images/lista1.jpg' width='40' height='40'></a></td>
                        <td ><a href='reporteciclo2.php?anio=".$idanio."&&cur=".$fila[1]."' target='_blank'><img src='images/lista2.png' width='40' height='40'></a></td>
                     </tr>";

        }
        $salida.="</tbody></table>";
    }else{
        $salida.="NO HAY DATOS :(";
    }


    echo $salida;

    $conn->close();



?>