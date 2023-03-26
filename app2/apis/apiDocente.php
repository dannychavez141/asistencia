<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
include'../controlers/mConexion.php';
include '../controlers/mMetodos.php';
include '../controlers/cDocente.php';
include '../controlers/cUsuario.php';
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
     case 'login':
        $modelo = new cUsuario();
        $datos = $modelo->login($_GET);
        print_r($datos);
        break;
    case 'todos':
        $modelo = new cDocente();
        $datos = $modelo->verTodos($_GET);
        print_r($datos);
        break;
    case 'AAula':
        $aula = $_GET["aula"];
        $modelo = new cDocente();
        $datos = $modelo->verAluAula($aula);
        //print_r($datos);
         print_r($datos);
        //print_r(json_encode($datos));
        break;
    case 'todosapp':
        $busq = $_GET["busq"];
        $modelo = new cDocente();
        $datos = $modelo->verTodosapp($busq);
          print_r($datos);
        break;
    case 'buno':
        $busq = $_GET["cod"];
        $modelo = new cDocente();
        $datos = $modelo->verUno($busq);
         print_r($datos);
        break;
    case 'rec':
        $id = $_POST['0'];
        $huella1 = $_POST['1'];
        $huella2 = $_POST['2'];
        $modelo = new cDocente();
        $datos = $modelo->AgregarHuellas($id, $huella1, $huella2);
         print_r($datos);
        break;
    case 'recapp':
        $id = $_POST['0'];
        $huella1 = $_POST['1'];
        $huella2 = $_POST['2'];
        $modelo = new cDocente();
        $datos = $modelo->AgregarHuellas($id, $huella1, $huella2);
        print_r($datos);
        break;
    case 'mod':

        break;

    default:
        echo "no se recibio las variables" . $control;
        break;
}
