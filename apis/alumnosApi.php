<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
include_once '../control/cConexion.php';
include_once '../control/cAlumno.php';
$control = null;
$metodo = "";
if (isset($_POST['ac']) && $control == null) {
    $control = $_POST['ac'];
} else if (isset($_GET['ac']) && $control == null) {
    $control = $_GET['ac'];
}

switch ($control) {
    case 'todos':
        $busq = $_GET["busq"];
        $modelo = new cAlumno();
        $datos = $modelo->verTodos($busq);
        print_r(json_encode($datos));
        break;
    case 'buno':
        $busq = $_GET["cod"];
        $modelo = new cAlumno();
        $datos = $modelo->verUno($busq);
        print_r(json_encode($datos));
        break;
    case 'reg':
        $id = $_POST['id'];
        $huella1 = $_POST['h1'];
        $huella2 = $_POST['h2'];
        $codhuella1 = $_POST['ih1'];
        $codehuella2 = $_POST['ih2'];
        $modelo = new cAlumno();
        $datos = $modelo->AgregarHuellas($id, $huella1, $huella2, $codhuella1, $codehuella2);
        print_r(json_encode($datos));
        break;

    case 'mod':

        break;

    default:
        echo "no se recibio las variables" . $control;
        break;
}
