<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
include'../controlers/mConexion.php';
include '../controlers/mMetodos.php';
include '../controlers/cActividad.php';
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
$modelo = new cActividad();
switch ($control) {

    case 'ver':
        //   print_r($model);
       
        $resp = $modelo->ver($_GET);
        print_r($resp);
        break;
     case 'verRep':
        //   print_r($model);
       
        $resp = $modelo->verRep($_GET);
        print_r($resp);
        break;
    case 'verTipo':
        //   print_r($model);
       
        $resp = $modelo->verTipo();
        print_r($resp);
        break;
    case 'reg':
        //   print_r($model);
        $resp = $modelo->crear($model);
        print_r($resp);
        break;
 case 'mod':
       // print_r($_POST);
        $datos = $modelo->modificar($_POST);
        print_r($datos);
        break;
    case 'marcar':
       // print_r($_POST);
        $datos = $modelo->marcar($model);
        print_r($datos);
        break;
    default:
        echo "no se recibio las variables" . $control;
        break;
}
