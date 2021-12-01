<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
include_once '../control/cConexion.php';
include_once '../control/cClase.php';
$control = null;
$metodo = "";
if (isset($_POST['ac']) && $control == null) {
    $control = $_POST['ac'];
} else if (isset($_GET['ac']) && $control == null) {
    $control = $_GET['ac'];
}

switch ($control) {
    case 'todos':
        $cod = $_GET["cod"];
        $modelo = new cClase();
        $datos = $modelo->verClasesDocente($cod);
        print_r(json_encode($datos));
        break;
    case 'buno':
        $cod = $_GET["cod"];
        $modelo = new cClase();
        $datos = $modelo->verUnaClase($cod);
        print_r(json_encode($datos));
        break;
    case 'bultimaclaseaula':
        $cod = $_GET["cod"];
        $modelo = new cClase();
        $datos = $modelo->verUClaseAula($cod);
        print_r(json_encode($datos));
        break;
    case 'reg':
        $modelo['idAsignacionDoc'] = $_POST['idAsignacionDoc'];
        $modelo['idAula'] = $_POST['idAula'];
        $modelo['fechaClas'] = $_POST['fechaClas'];
        $modelo['horClas'] = $_POST['horClas'];
        $modelo['cierre'] = $_POST['cierre'];
        $modelo['est'] = $_POST['cierre'];
        $control = new cClase();
        $datos = $control->registrar($modelo);
        print_r(json_encode($datos));
        break;

    case 'mod':
        $modelo['idAsignacionDoc'] = $_POST['idAsignacionDoc'];
        $modelo['idAula'] = $_POST['idAula'];
        $modelo['fechaClas'] = $_POST['fechaClas'];
        $modelo['horClas'] = $_POST['horClas'];
        $modelo['cierre'] = $_POST['cierre'];
        $modelo['est'] = $_POST['cierre'];
        $modelo['idClase'] = $_POST['idClase'];
        $control = new cClase();
        $datos = $control->modificar($modelo);
        print_r(json_encode($datos));
        break;

    default:
        echo "no se recibio las variables" . $control;
        break;
}
