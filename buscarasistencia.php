<?php
  include_once'./conexion.php'; 

    $conn = $mysqli;
      if($conn->connect_error){
        die("Conexión fallida: ".$conn->connect_error);
      }

$id =$_POST['id'];
    $salida = "";

    $query = "SELECT a.idClase,a.codAlu,concat(al.apepaAlu,' ',al.apemaAlu,' ',al.nomAlu) as alum from asistencia a join alumno al on a.codAlu=al.codAlu where a.idClase=$id and concat(a.codAlu,al.apepaAlu,al.apemaAlu,al.nomAlu) like '%%' ORDER BY al.apepaAlu asc";

    if (isset($_POST['consulta'])) {
        $q = $conn->real_escape_string($_POST['consulta']);
        $query = "SELECT a.idClase,a.codAlu,concat(al.apepaAlu,' ',al.apemaAlu,' ',al.nomAlu) as alum from asistencia a join alumno al on a.codAlu=al.codAlu where a.idClase=$id and concat(a.codAlu,al.apepaAlu,al.apemaAlu,al.nomAlu) like '%$q%' ORDER BY al.apepaAlu asc";
    }

    $resultado = $conn->query($query);


    if ($resultado->num_rows>0) {
       

        $salida.="<table border=1 class='tabla_datos'>
                <thead>
                    <tr id='titulo'>
                        <td>Codigo</td>
                        <td>Alumno</td>
                    </tr>

                </thead>
                

        <tbody>";

        while ($fila = $resultado->fetch_array()) {
              

            $salida.="<tr>
                        <td>".$fila[1]."</td>
                        <td>".$fila[2]."</td>
                        </tr>";

        }
        $salida.="</tbody></table>";
    }else{
        $salida.="NO HAY DATOS :(";
    }


    echo $salida;

    $conn->close();



?>