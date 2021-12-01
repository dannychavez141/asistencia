<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
include_once '../control/cConexion.php';
include_once '../control/cAlumno.php';
$control = null;

$datos = json_decode(file_get_contents('php://input'), true);

//print_r($_POST['ac']);
if (isset($_POST['ac']) && $control == null) {
    $control = $_POST['ac'];
} else if (isset($_GET['ac']) && $control == null) {
    $control = $_GET['ac'];
} else if (isset($datos['ac']) && $control == null) {
    $control = $datos['ac'];
}

switch ($control) {
    case 'todos':
        $busq = $_GET["busq"];
        $modelo = new cAlumno();
        $datos = $modelo->verTodos($busq);
        print_r(json_encode($datos));
        break;
    case 'AAula':
        $aula = $_GET["aula"];
        $anio = $_GET["anio"];
        $modelo = new cAlumno();
        $datos = $modelo->verAluAula($aula, $anio);
        //print_r($datos);
        echo json_encode($datos);
        //print_r(json_encode($datos));
        break;
    case 'todosapp':
        $busq = $_GET["busq"];
        $modelo = new cAlumno();
        $datos = $modelo->verTodosapp($busq);
        print_r(json_encode($datos));
        break;
    case 'buno':
        $busq = $_GET["cod"];
        $modelo = new cAlumno();
        $datos = $modelo->verUno($busq);
        print_r(json_encode($datos));
        break;
    case 'rec':
        $id = $datos['0'];
        $huella1 = $datos['1'];
        $huella2 = $datos['2'];

        $modelo = new cAlumno();
        $datos = $modelo->AgregarHuellas($id, $huella1, $huella2);
        print_r(json_encode($datos));
        break;
    case 'recapp':
        $id = $_POST['0'];
        $huella1 = $_POST['1'];
        $huella2 = $_POST['2'];
        $modelo = new cAlumno();
        $datos = $modelo->AgregarHuellas($id, $huella1, $huella2);
        print_r(json_encode($datos));
        break;
    case 'mod':

        break;

    default:
        echo "no se recibio las variables" . $control;
        break;
}
