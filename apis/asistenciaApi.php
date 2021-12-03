<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
include_once '../control/cConexion.php';
include_once '../control/cAsistencia.php';
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
        $tipo= $_GET["tipo"];
        $busq= $_GET["busq"];
        $modelo = new cAsistencia();
        $datos = $modelo->verAsistiencia($tipo, $cod,$busq);
        print_r(json_encode($datos));
       
        break;
    case 'buno':
        
        break;
    case 'reg':
        $modelo['idClase'] = $_POST['idClase'];
        $modelo['codAlu'] = $_POST['codAlu'];
        $control = new cAsistencia();
        $datos = $control->registrar($modelo);
        print_r(json_encode($datos));
        break;

    case 'mod':
        
        break;

    default:
        echo "no se recibio las variables" . $control;
        break;
}
