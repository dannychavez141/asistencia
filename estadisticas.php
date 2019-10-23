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
            <br>
         <center>
                <div class="col-lg-10 contact-right-wthree-info login">
                   
                   <table>
                    <form action="grafico1.php" method="post" target="_blank">
                     <tr>
                      <td colspan="2">  
                        <select class="form-control" name="anio">
                            <option>Seleccione Año</option>
                        <?php $url="SELECT * FROM anioacademico where est=1 order by idAnioAcademico desc ;";
                         $clase= $mysqli->query($url);
                        while ($fila = $clase->fetch_array()) {
                        $anio=$fila[1];
                        ?>
                          <option value="<?php echo $fila[0]; ?>"><?php echo $anio; ?></option> 

                        <?php } ?>
                    </select>
                    </td>
                       
                        
                        <td><button class="btn btn-success" type="submit">Cantidad de clases por curso</button></td>
                    </tr>
                </form>
                
                    
                    <form action="grafico2.php" method="post" target="_blank">
                     <tr>
                      <td>  
                        <select class="form-control" name="anio">
                            <option>Seleccione Año</option>
                        <?php $url="SELECT * FROM anioacademico where est=1 order by idAnioAcademico desc ;";
                         $clase= $mysqli->query($url);
                        while ($fila = $clase->fetch_array()) {
                        $docente=$fila[1];
                        ?>
                          <option value="<?php echo $fila[0]; ?>"><?php echo $docente; ?></option> 

                        <?php } ?>
                    </select>
                    </td>
                       <td>  
                        <select class="form-control" name="curso">
                            <option>Seleccione Curso</option>
                        <?php $url="SELECT * FROM curso where est=1;";
                         $clase= $mysqli->query($url);
                        while ($fila = $clase->fetch_array()) {
                        $curso=$fila[1];
                        ?>
                          <option value="<?php echo $fila[0]; ?>"><?php echo $curso; ?></option> 

                        <?php } ?>
                    </select>
                    </td>
                        
                        <td><button class="btn btn-success" type="submit">Asistencia por alumno a curso</button></td>
                    </tr>
                </form>
                 <form action="grafico3.php" method="post" target="_blank">
                     <tr>
                      <td colspan="2">  
                        <select class="form-control" name="anio">
                            <option>Seleccione Año</option>
                        <?php $url="SELECT * FROM anioacademico where est=1 order by idAnioAcademico desc ;";
                         $clase= $mysqli->query($url);
                        while ($fila = $clase->fetch_array()) {
                        $anio=$fila[1];
                        ?>
                          <option value="<?php echo $fila[0]; ?>"><?php echo $anio; ?></option> 

                        <?php } ?>
                    </select>
                    </td>
                       
                        
                        <td><button class="btn btn-success" type="submit">Cantidad de alumnos por curso</button></td>
                    </tr>
                </form>
                   </table>

             
            </div>
</center>
        </div>
    </section>
  
  
</body>

</html>