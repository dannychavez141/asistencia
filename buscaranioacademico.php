<?php
  include_once'./conexion.php'; 

    $conn = $mysqli;
      if($conn->connect_error){
        die("Conexión fallida: ".$conn->connect_error);
      }

    $salida = "";

    $query = "SELECT * FROM asistencia.anioacademico a join estados e on a.est=e.idestados where a.descr like '%%';";

    if (isset($_POST['consulta'])) {
        $q = $conn->real_escape_string($_POST['consulta']);
        $query = "SELECT * FROM asistencia.anioacademico a join estados e on a.est=e.idestados where a.descr like '%$q%';";
    }

    $resultado = $conn->query($query);


    if ($resultado->num_rows>0) {
       

        $salida.="<table border=1 class='tabla_datos'>
                <thead>
                    <tr id='titulo'>
                        <td>Codigo</td>
                        <td>Nombre de Año Universitario</td>
                        <td>Estado</td>
                        <td>Editar</td>
                    </tr>

                </thead>
                

        <tbody>";

        while ($fila = $resultado->fetch_array()) {
              

            $salida.="<tr>
                        <td>".$fila[0]."</td>
                        <td>".$fila[1]."</td>
                       
                        <td>".$fila[4]."</td>
                        <td><a href='modaniouniversitario.php?cod=".$fila[0]."' ><img src='images/edit.jpg' width='40' height='40'></a></td></tr>";

        }
        $salida.="</tbody></table>";
    }else{
        $salida.="NO HAY DATOS :(";
    }


    echo $salida;

    $conn->close();



?>