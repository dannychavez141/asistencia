
<!DOCTYPE html>
<html lang="zxx">
    <?php
    error_reporting(0);
    include_once'./cabezera2.php';
    $cod = $_GET['cod'];
    $anio = $_POST['anio'];
    if ($anio == null) {
        $anio = $_GET['anio'];
    }
    $conf = $_GET['tconf'];
    if ($conf) {
        echo "<script>alert('Operacion Realizada exitosamente');</script>";
    }
    require 'conexion.php';
    ?>

    <body>
        <h1>Cursos de Docentes Registrados</h1>

        <table border="1">
            <?php
            $url = "SELECT * FROM docente where idDocente='$cod';";
            $clase = $mysqli->query($url);

            while ($fila = $clase->fetch_array()) {
                $docente = $fila[2] . ' ' . $fila[3] . ' ' . $fila[1];
                ?>

                <tr><td bgcolor="#81C784"><h1>DOCENTE:</h1></td><td colspan="2" bgcolor="#F1F8E9"><h1><?php echo $docente; ?></h1></td></tr>

            <?php } ?>

            <form action="cursodocente.php?cod=<?php echo $cod; ?>"    method="post" >
                <tr><td bgcolor="#81C784"><h1>SELECCIONE AÑO ACADEMICO:</h1></td><td bgcolor="#F1F8E9"> <h1><select name="anio">
                                <?php
                                $url = "SELECT * FROM anioacademico order by idAnioAcademico desc;";
                                $clase = $mysqli->query($url);

                                while ($fila = $clase->fetch_array()) {
                                    ?>
                                    <option value="<?php echo $fila[0]; ?>"><?php echo $fila[1]; ?></option>
                                <?php } ?>

                            </select></h1>
                    </td><td><h1><button >VISUALIZAR</button></h1></td>
                </tr>
            </form>
            <?php if ($anio != null) {
                ?>

                <?php
                $url = "SELECT * FROM anioacademico where idAnioAcademico='$anio'";
                $aniouni = $mysqli->query($url);

                while ($fila = $aniouni->fetch_array()) {
                    ?>

                    <tr><td colspan="2" bgcolor="#03A9F4"><h1>AÑO ACADEMICO SELECCIONADO:</h1></td><td bgcolor="#B2EBF2"><h1><?php echo $fila[1] ?></h1></td></tr>
                <?php } ?>
                <form action="modelos/agregarasigdocente.php?doc=<?php echo $cod; ?>&&anio=<?php echo $anio; ?>"    method="post" >
                    <tr><td bgcolor="#AB47BC
                            "><h1>SELECCIONE CURSO A ASIGNAR:</h1>
                            <h1><select name="cur">
                                    <?php
                                    $url = "Select c.* From curso  c left join asignaciondoc  a ON   c.idCurso = a.idCurso and a.idAnioAcademico='$anio'and a.est=1 where a.idCurso is null";
                                    $clase = $mysqli->query($url);

                                    while ($fila = $clase->fetch_array()) {
                                        ?>
                                        <option value="<?php echo $fila[0]; ?>"><?php echo $fila[1]; ?></option>
                                    <?php } ?>

                                </select></h1>
                        </td>
                        <td bgcolor="#AB47BC
                            "><h1>ASIGNAR AULA:</h1>
                            <h1><select name="aula">
                                    <?php
                                    $url = "SELECT * FROM aula where est =1;";
                                    $clase = $mysqli->query($url);

                                    while ($fila = $clase->fetch_array()) {
                                        ?>
                                        <option value="<?php echo $fila[0]; ?>"><?php echo $fila[1]; ?></option>
                                    <?php } ?>

                                </select></h1>
                        </td><td><h1><button >ASIGNAR</button></h1></td>
                    </tr>
                </form>
                <form>
                    <tr bgcolor="#FF7043"><td colspan="1"><h1> Cursos Asigandos</h1></td><td colspan="1"><h1>Estado</h1></td><td colspan="2"><h1>ACCION</h1></td></tr>
                    <?php
                    $url = "SELECT * FROM asignaciondoc a join curso c on a.idCurso=c.idCurso join anioacademico au on a.idAnioAcademico=au.idAnioAcademico where  a.idDocente=$cod and a.idAnioAcademico=$anio ;";
                    $clase = $mysqli->query($url);
                    $cont = 0;
                    while ($fila = $clase->fetch_array()) {
                        $cont++;
                        ?>

                        <tr bgcolor="#FFE0B2"><td colspan="1"><h1><?php echo $fila[7]; ?></h1></td>
                            <td><h1><?php
                                    if ($fila[5] == 1) {
                                        echo 'HABILITADO';
                                    } else {
                                        echo 'DESHABILITADO';
                                    }
                                    ?></h1></td>
                            <?php if ($fila[5] == 1) {
                                ?>
                                <td><a href="modelos/quitarasigdocente.php?cod=<?php echo $fila[0]; ?>&&est=2&&anio=<?php echo $anio; ?>&&doc=<?php echo $cod; ?>"><h1><input type="button" name="" value="DESHABILITAR"></h1></a></td>
                            <?php } else { ?>
                                <td><a href="modelos/quitarasigdocente.php?cod=<?php echo $fila[0]; ?>&&est=1&&anio=<?php echo $anio; ?>&&doc=<?php echo $cod; ?>"><h1><input type="button" name="" value="HABILITAR"></h1></a></td>
                            <?php } ?> 
                        </tr>
                    </form>
                <?php } if ($cont == 0) { ?>
                    <tr><td colspan="3"><h1>DOCENTE NO TIENE CURSOS ASIGNADOS</h1></td></tr>
                <?php } ?>

            <?php } ?>

        </table>


    </body>

</html>