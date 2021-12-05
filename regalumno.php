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
            <h3 class="tittle-wthree text-center">Registrando Alumno</h3>
         <center>
                <div class="col-lg-6 contact-right-wthree-info login">
                    <h5 class="text-center mb-4"></h5>
                    <form action="modelos/calumno.php" method="post" enctype="multipart/form-data">
                     
                         <div class="form-group mt-4">
                            <label> Codigo Universitario:</label>
                            <input type="text" class="form-control" id="validationDefault01" maxlength="10" name="tcod" onkeypress="return esInteger(event)" value="" required="" placeholder="Ingrese Codigo Universitario">
                        </div>
                        <div class="form-group mt-4">
                            <label>Nombres:</label>

                            <input type="text" class="form-control" id="validationDefault01" value="" onkeypress="return validar(event)" maxlength="40" name="tnom" required="" placeholder="Ingrese Nombres">
                        </div><div class="form-group mt-4">
                            <label>Apellido Paterno:</label>

                            <input type="text" class="form-control" id="validationDefault01" value="" name="tapepa" required="" onkeypress="return validar(event)" maxlength="25" placeholder="Ingrese Apellido Paterno">
                        </div><div class="form-group mt-4">
                            <label>Apellido Materno:</label>

                            <input type="text" class="form-control" id="validationDefault01" value="" name="tapema" required="" onkeypress="return validar(event)" maxlength="25" placeholder="Ingrese Apellido Materno">
                        </div>
                       <div class="form-group mt-4">
                            <label> Foto del Estudiante:</label>
                            

                            <input type="file" class="form-control" id="validationDefault01"name="foto" onkeypress="return esInteger(event)" value="" required="" placeholder="Ingrese idhuella" readonly>
                        </div>

                        
                        <div class="form-group mt-4">
                            <label>Estado:</label>
                            <select class="form-control" id="validationDefault01" name="test">
                                <option value="1">Activo</option>
                                <option value="2">Inactivo</option>
                            </select>
                        </div>
                        <a href="alumno.php"><button type="button" class="btn btn-primary submit mb-4">Cancelar</button></a>
                        <button type="submit" class="btn btn-primary submit mb-4" value="R" name="baccion">Registrar</button>
                 
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