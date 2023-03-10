<!DOCTYPE html>
<html lang="zxx">

    <?php
    include_once'./cabezera.php';
    $id = $_GET['cod'];

    require 'conexion.php';
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
                <h3 class="tittle-wthree text-center">Modificando Alumno</h3>
                <center>
                    <div class="col-lg-6 contact-right-wthree-info login">
                        <h5 class="text-center mb-4"></h5>
                        <form action="modelos/calumno.php" method="post" enctype="multipart/form-data" >
                            <?php
                            $url = "SELECT * FROM alumno a join estados e on a.est=e.idestados where a.codAlu=$id;";
                            $docente = $mysqli->query($url);

                            while ($fila = $docente->fetch_array()) {
                                ?>
                                <div class="form-group mt-4">
                                    <label> Codigo Universitario:</label>
                                    <input type="text" class="form-control" id="validationDefault01" maxlength="8"name="tcod" onkeypress="return esInteger(event)" value="<?php echo $fila[0]; ?>" required="" placeholder="Ingrese Codigo" readonly>
                                </div>
                                <div class="form-group mt-4">
                                    <label>Nombres:</label>

                                    <input type="text" class="form-control" id="validationDefault01" value="<?php echo $fila[1]; ?>" onkeypress="return validar(event)" maxlength="15" name="tnom" required="" placeholder="Ingrese Nombres">
                                </div><div class="form-group mt-4">
                                    <label>Apellido Paterno:</label>

                                    <input type="text" class="form-control" id="validationDefault01" value="<?php echo $fila[2]; ?>" name="tapepa" required="" onkeypress="return validar(event)" maxlength="15" placeholder="Ingrese Apellido Paterno">
                                </div><div class="form-group mt-4">
                                    <label>Apellido Materno:</label>

                                    <input type="text" class="form-control" id="validationDefault01" value="<?php echo $fila[3]; ?>" name="tapema" required="" onkeypress="return validar(event)" maxlength="15" placeholder="Ingrese Dni">
                                </div>
                                <div class="form-group mt-4">
                                    <img style='display:block; width:100px;height:100px;' id='base64image'  src='data:image/jpeg;base64,<?php echo $fila[4];?>' />
                                    <label> Foto del Alumno:</label>
                                    <input type="file" accept="image/png,image/jpeg" class="form-control" id="validationDefault01" name="foto" placeholder="Subir nueva foto" >
                                </div>


                                <div class="form-group mt-4">
                                    <label>Estado:</label>
                                    <select class="form-control" id="validationDefault01" name="test">
                                        <option value="<?php echo $fila[8]; ?>"><?php echo $fila[9]; ?></option>
                                        <option value="1">Activo</option>
                                        <option value="2">Inactivo</option>
                                    </select>
                                </div>
                                <input type="text" class="form-control" id="validationDefault01" maxlength="8"name="tcod" onkeypress="return esInteger(event)" value="<?php echo $fila[0]; ?>" required="" readonly="readonly" style="visibility:hidden">
                                <a href="alumno.php"><button type="button" class="btn btn-primary submit mb-4">Cancelar</button></a>
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
                document.forma.action = 'cdocente.php';
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
            if (tecla == 8)
                return true; // 3
            ppatron = /\d/; // Solo acepta números// 4
            te = String.fromCharCode(tecla); // 5
            return patron.test(te); // 6
        }
        function validar(e) { // 1
            tecla = (document.all) ? e.keyCode : e.which; // 2
            if (tecla == 8)
                return true; // 3
            patron = /[A-Za-z\sñÑ]/; // 4
            te = String.fromCharCode(tecla); // 5
            return patron.test(te); // 6
        }
    </script>
</html>