<!DOCTYPE html>
<html lang="zxx">

<?php 
 include_once'./cabezera.php';  
$id=$_GET['cod'];

require 'conexion.php';?>

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
            <h3 class="tittle-wthree text-center">Modificando docente</h3>
         <center>
                <div class="col-lg-6 contact-right-wthree-info login">
                    <h5 class="text-center mb-4"></h5>
                    <form action="modelos/ccurso.php" method="post">
                       <?php $url="SELECT * FROM asistencia.curso c join estados e on  c.est=e.idestados where idCurso=$id;";
                     $docente= $mysqli->query($url);

  while ($fila = $docente->fetch_array()) {
    
                       ?>
                         <div class="form-group mt-4">
                            <label> CODIGO:</label>
                            <input type="text" class="form-control" id="validationDefault01" maxlength="8"name="tcod" onkeypress="return esInteger(event)" value="<?php echo $fila[0];?>" required="" placeholder="Ingrese Dni">
                        </div>
                        <div class="form-group mt-4">
                            <label>Nombre del Curso:</label>

                            <input type="text" class="form-control" id="validationDefault01" value="<?php echo $fila[1];?>" onkeypress="return validar(event)" maxlength="30" name="tnom" required="" placeholder="Ingrese Nombres">
                        </div>
                       
                        <div class="form-group mt-4">
                            <label>Estado:</label>
                            <select class="form-control" id="validationDefault01" name="test">
                                <option value="<?php echo $fila[3];?>"><?php echo $fila[4];?></option>
                                <option value="1">Activo</option>
                                <option value="2">Inactivo</option>
                            </select>
                        </div>
                        <input type="text" class="form-control" id="validationDefault01" maxlength="8"name="tcod" onkeypress="return esInteger(event)" value="<?php echo $fila[0];?>" required="" readonly="readonly" style="visibility:hidden">
                        <a href="curso.php"><button type="button" class="btn btn-primary submit mb-4">Cancelar</button></a>
                        <button type="submit" class="btn btn-primary submit mb-4" value="M" name="baccion">Modificar</button>
                    <?php } ?>
                    </form>

             
            </div>
</center>
        </div>
    </section>
  
  
</body>
<script language="JavaScript"> 
function guardar() 
{ 
var statusConfirm = confirm("¿Deseas guardar Registro?"); 
if (statusConfirm == true) 
{ 
document.forma.action='cdocente.php'; 
document.forma.submit(); 
} 
} 
</script> 
 <script type="text/javascript">
                    function esInteger(e) {
var charCode 
charCode = e.keyCode 
status = charCode 
if (charCode > 31 && (charCode < 48 || charCode > 57)) {
return false
}
return true
}
function numeros(nu) { // 1
tecla = (document.all) ? e.keyCode : e.which; // 2
if (tecla==8) return true; // 3
ppatron = /\d/; // Solo acepta números// 4
te = String.fromCharCode(tecla); // 5
return patron.test(te); // 6
}
function validar(e) { // 1
tecla = (document.all) ? e.keyCode : e.which; // 2
if (tecla==8) return true; // 3
patron =/[A-Za-z\sñÑ]/; // 4
te = String.fromCharCode(tecla); // 5
return patron.test(te); // 6
}
                </script>
</html>