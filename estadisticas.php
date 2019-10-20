<!DOCTYPE html>
<html lang="zxx">

<?php 
 include_once'./cabezera.php';  
 include_once'./conexion.php'; 
 

?>

<body>
    <!-- home -->
    <div id="home" class="inner-w3pvt-page">
        <div class="overlay-innerpage">
            <!-- banner -->
            <div class="top_w3pvt_main container">

               
            </div>
            <!-- //nav -->

        </div>
        <!-- //banner -->
    </div>
   
    <section class="about py-3">
        <div class="container py-md-3">
            <h3 class="tittle-wthree text-center">Generar Graficos Estadisticos</h3>
         <center>
                <div class="col-lg-10 contact-right-wthree-info login">
                   
                   <table>
                     <tr>
                        <?php $url="SELECT * FROM docente where idDocente='$cod';";
                     $clase= $mysqli->query($url);

  while ($fila = $clase->fetch_array()) {
$docente=$fila[2].' '.$fila[3].' '.$fila[1];
    ?>

    <tr><td bgcolor="#81C784"><h1>DOCENTE:</h1></td><td colspan="2" bgcolor="#F1F8E9"><h1><?php echo $docente; ?></h1></td></tr>

<?php } ?>
                       <td><select class="form-control"><option></option></select></td>
                        <td><select class="form-control"><option></option></select></td>
                        <td><a href=""><button class="btn btn-success">Cantidad de clases por curso</button></a></td>
                    </tr>
                    <tr>
                         <td><select class="form-control"><option></option></select></td>
                          <td><select class="form-control"><option></option></select></td>
                         <td><a href=""><button class="btn btn-success">Cantidad de alumnos por curso</button></a></td>
                     </tr>
                    <tr> 
                         <td><select class="form-control"><option></option></select></td>
                         <td><a href=""><button class="btn btn-success">Promedio de asistencias por curso</button></a></td>
                     </tr>
                   </table>

             
            </div>
</center>
        </div>
    </section>
  
  
</body>

</html>