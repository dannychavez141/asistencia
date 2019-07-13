<?php
  include_once'./conexion.php'; 

    $conn = $mysqli;
      if($conn->connect_error){
        die("Conexión fallida: ".$conn->connect_error);
      }

    $salida = "";

    $query = "SELECT * FROM asistencia.alumno a join estados e on a.est=e.idestados where concat(a.codAlu,a.nomAlu,a.apepaAlu,a.apemaAlu) like '%%';";

    if (isset($_POST['consulta'])) {
        $q = $conn->real_escape_string($_POST['consulta']);
        $query = "SELECT * FROM asistencia.alumno a join estados e on a.est=e.idestados where concat(a.codAlu,a.nomAlu,a.apepaAlu,a.apemaAlu) like '%$q%';";
    }

    $resultado = $conn->query($query);


    if ($resultado->num_rows>0) {
       

        $salida.="<table border=1 class='tabla_datos'>
                <thead>
                    <tr id='titulo'>
                        <td>Codigo</td>
                        <td>Apellidos y Nombres</td>
                        <td>Estado</td>
                        <td>Ver Cursos</td>
                    </tr>

                </thead>
                

        <tbody>";

        while ($fila = $resultado->fetch_array()) {
              

            $salida.="<tr align='center'>
                        <td>".$fila[0]."</td>
                        <td>".$fila[2]." ".$fila[3]." ".$fila[1]."</td>
                       
                        <td>".$fila[7]."</td>
                        <td ><a href='cursoalumno.php?cod=".$fila[0]."' ><img src='images/edit.jpg' width='40' height='40'></a></td></tr>";

        }
        $salida.="</tbody></table>";
    }else{
        $salida.="NO HAY DATOS :(";
    }


    echo $salida;

    $conn->close();



?>