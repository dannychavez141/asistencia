<?php

//error_reporting(0);
require 'conexion.php';
$accion = $_POST['baccion'];
echo "go?" . $accion;
switch ($accion) {
    case 'R':
        $tcod = $_POST['tcod'];
        $tnom = $_POST['tnom'];
        $tapepa = $_POST['tapepa'];
        $tapema = $_POST['tapema'];
        $thue = $_POST['thue'];
        $test = $_POST['test'];
        $destino = "../img/temp.png";
        if (isset($_FILES["foto"]["tmp_name"])) {
            $temp = $_FILES['foto']['tmp_name'];
            if (move_uploaded_file($temp, $destino)) {
                chmod($destino, 0777);
            }
            $imagedata = file_get_contents($destino);
            $imgbase = base64_encode($imagedata);

            $sql = "INSERT INTO `alumno` (`codAlu`, `nomAlu`, `apepaAlu`, `apemaAlu`, `foto`, `est`, `imghuella1`, `imghuella2`) VALUES ('$tcod', '$tnom', '$tapepa', '$tapema', '$imgbase', '$test','1','1');";
        } else {
            $sql = "INSERT INTO `alumno` (`codAlu`, `nomAlu`, `apepaAlu`, `apemaAlu`, `foto`, `est`, `imghuella1`, `imghuella2`) VALUES ('$tcod', '$tnom', '$tapepa', '$tapema', '1', '$test','1','1');";
        }
        echo $sql;
        $rs = $mysqli->query($sql);

     echo "<script>window.location='../alumno.php?tconf=true'</script>";
        exit;
        break;

    case 'M':
        $tcod = $_POST['tcod'];
        $tnom = $_POST['tnom'];
        $tapepa = $_POST['tapepa'];
        $tapema = $_POST['tapema'];
        $test = $_POST['test'];
        $destino = "../img/temp.png";
        if (isset($_FILES["foto"]["tmp_name"])) {
            $temp = $_FILES['foto']['tmp_name'];
            if (move_uploaded_file($temp, $destino)) {
                chmod($destino, 0777);
            }
            $imagedata = file_get_contents($destino);
            $imgbase = base64_encode($imagedata);
            $sql = "UPDATE `alumno` SET `nomAlu`='$tnom', `apepaAlu`='$tapepa', `apemaAlu`='$tapema', `est`='$test', `foto`='$imgbase' WHERE `codAlu`='$tcod';";
        } else {
            $sql = "UPDATE `alumno` SET `nomAlu`='$tnom', `apepaAlu`='$tapepa', `apemaAlu`='$tapema', `est`='$test' WHERE `codAlu`='$tcod';";
        }

        //  echo $sql;
        $rs = $mysqli->query($sql);
        echo "<script>window.location='../alumno.php?tconf=true'</script>";
        exit;
        break;
    default:
        # code...
        break;
}
?>
