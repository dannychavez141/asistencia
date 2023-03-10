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
            <h3 class="tittle-wthree text-center">Modificando Clase</h3>
         <center>
                <div class="col-lg-6 contact-right-wthree-info login">
                    <h5 class="text-center mb-4"></h5>
                    <form action="modelos/cclase.php" method="post">
                       <?php $url="SELECT c.idClase,c.idAsignacionDoc,cu.descr as curso,d.nomDoc,d.apepaDoc,d.apemaDoc,aa.descr as auni,c.fechaClas,c.horClas,c.est,e.descr as estado FROM clase c 
join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc 
join curso cu on ad.idCurso=cu.idCurso
join docente d on ad.idDocente=d.idDocente
join anioacademico aa on ad.idAnioAcademico=aa.idAnioAcademico
join estados e on c.est=e.idestados  where c.idClase=$id;";
                     $clase= $mysqli->query($url);

  while ($fila = $clase->fetch_array()) {
     if($fila[9]==1){
    $estado="Activo";
 }else {$estado="Inactivo";}
                       ?>
                         <div class="form-group mt-4">
                            <label> Curso:(no modificable)</label>
                            <input type="text" class="form-control" id="validationDefault01" maxlength="8"name="tlog" onkeypress="return esInteger(event)" value="<?php echo $fila[2];?>" required="" readonly="readonly">
                        </div>
                        <div class="form-group mt-4">
                            <label>Docente:(no modificable)</label>

                            <input type="text" class="form-control" id="validationDefault01" value="<?php echo $fila[4].' '.$fila[5].' '.$fila[3];?>" onkeypress="return validar(event)" maxlength="15" name="tnom" required="" readonly="readonly">
                        </div><div class="form-group mt-4">
                            <label>Año Universitario:(no modificable)</label>
                            <input type="text" class="form-control" id="validationDefault01" value="<?php echo $fila[6];?>" name="tapepa" required="" onkeypress="return validar(event)" maxlength="15" readonly="readonly">
                        </div><div class="form-group mt-4">
                            <label>Fecha:</label>

                            <input type="date" class="form-control" id="validationDefault01" value="<?php echo $fila[7];?>" name="tfec" required="" onkeypress="return validar(event)" maxlength="15" >
                        </div>
                       
                        <div class="form-group mt-4">
                            <label>Hora</label>
                            <input type="time" class="form-control" id="validationDefault01" value="<?php echo $fila[8];?>" name="thor" required="" >
                        </div>
                        <div class="form-group mt-4">
                            <label>Estado:</label>
                            <select class="form-control" id="validationDefault01" name="test">
                                <option value="<?php echo $fila[9];?>"><?php echo $estado;?></option>
                                <option value="1">Activo</option>
                                <option value="2">Inactivo</option>
                            </select>
                        </div>
                        <input type="text" maxlength="8"name="tcod" onkeypress="return esInteger(event)" value="<?php echo $fila[0];?>" required="" readonly="readonly" style="visibility:hidden">
                        <a href="clase.php"><button type="button" class="btn btn-primary submit mb-4">Cancelar</button></a>
                        <button type="submit" class="btn btn-primary submit mb-4" value="M" name="baccion" onclick="guardar()">Modificar</button>
                    <?php } ?>

                    </form>

             
            </div>
</center>
        </div>
    </section>
  
  
</body>
<script > 
function guardar() 
{ 
var statusConfirm = confirm("¿Deseas guardar Registro?"); 
if (statusConfirm == true) 
{ 
document.form.action='modelos/cclase.php'; 
document.form.submit(); 
} 
} 

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
patron =/[A-Za-z\s]/; // 4
te = String.fromCharCode(tecla); // 5
return patron.test(te); // 6
}
                </script>
</html>