<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
include'../controlers/mConexion.php';
include '../controlers/mMetodos.php';
include '../controlers/cHorario.php';
$control = null;

$model = json_decode(file_get_contents('php://input'), true);

//print_r($_POST['ac']);
if (isset($_POST['ac']) && $control == null) {
    $control = $_POST['ac'];
} else if (isset($_GET['ac']) && $control == null) {
    $control = $_GET['ac'];
} else if (isset($model['ac']) && $control == null) {
    $control = $model['ac'];
}
switch ($control) {

    case 'ver':
        //   print_r($model);
        $modelo = new cHorario();
        $resp = $modelo->verUno($_GET);
        print_r($resp);
        break;
    case 'eli':
        $modelo = new cHorario();
        $resp = $modelo->eliminar($model);
        print_r($resp);
        break;
        break;
 case 'reg':
       $modelo = new cHorario();
        $resp = $modelo->crear($model);
        print_r($resp);
        break;
    default:
        echo "no se recibio las variables";
        break;
}
