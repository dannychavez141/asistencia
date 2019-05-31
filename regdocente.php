
<!DOCTYPE html>
<html lang="zxx">

<?php error_reporting(0);
 include_once'./cabezera.php';  ?>

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
            <h3 class="tittle-wthree text-center">Registrando nuevo docente</h3>
         <center>
            

                
                <div class="col-lg-6 contact-right-wthree-info login">
                    <h5 class="text-center mb-4"></h5>
                    <form action="modelos/cdocente.php" method="post">
                         <div class="form-group mt-4">
                            <label>DNI:</label>

                            <input type="text" class="form-control" id="validationDefault01" maxlength="8"name="tdni" onkeypress="return esInteger(event)"value="" required="" placeholder="Ingrese Dni">
                        </div>
                        <div class="form-group mt-4">
                            <label>Nombres:</label>

                            <input type="text" class="form-control" id="validationDefault01" value="" name="tnom" required="" placeholder="Ingrese Nombres">
                        </div><div class="form-group mt-4">
                            <label>Apellido Paterno:</label>

                            <input type="text" class="form-control" id="validationDefault01" value="" name="tapepa" required=""  placeholder="Ingrese Apellido Paterno">
                        </div><div class="form-group mt-4">
                            <label>Apellido Materno:</label>

                            <input type="text" class="form-control" id="validationDefault01" value="" name="tapema" required=""  placeholder="Ingrese Dni">
                        </div>
                       
                        <div class="form-group mt-4">
                            <label>Clave:</label>
                            <input type="password" class="form-control" id="validationDefault01" value="" name="tpass" required=""  placeholder="Ingrese Clave">
                        </div>
                        <a href="docente.php"><button type="button" class="btn btn-primary submit mb-4">Cancelar</button></a>
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
patron =/[A-Za-z\s]/; // 4
te = String.fromCharCode(tecla); // 5
return patron.test(te); // 6
}
                </script>
</html>
