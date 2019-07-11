
<!DOCTYPE html>
<html lang="zxx">
<?php
session_start();
if (isset($_SESSION['usuario'])) {
    echo "";
}else{
    header("Location: login.php");
    exit();
}
$usuario=$_SESSION['usuario'];
$idusuario=$_SESSION['idUsuario'];
?>
<head>
    <title>Sistema de Control de Asistencia</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <script>
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
    <!-- //Meta tag Keywords -->
    <!-- Custom-Files -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <!-- font-awesome-icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome-icons -->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
    <link rel="stylesheet" type="text/css" href="css/estilos.css"> 
</head>

<body>

<!-- home -->
    <div id="home" class="inner-w3pvt-page">
        <div class="overlay-innerpage">
            <!-- banner -->
            <div class="top_w3pvt_main container">
<!-- nav -->
            <div class="nav_w3pvt text-center ">
                <!-- nav -->
                <nav class="lavi-wthree">
                    <div id="logo">
                        <h1> <a class="navbar-brand" href="index.html">Asistencia</a>
                        </h1>
                    </div>

                    <label for="drop" class="toggle">Menu</label>
                    <input type="checkbox" id="drop" />
                    <ul class="menu mr-auto">
                        <li class="active"><a href="index.php">Inicio</a></li>
                         <li><a href="docente.php">Docentes</a>
                             <li><a href="clase.php">Clases</a>
                                <li><a href="curso.php">Cursos</a>
                                    <li><a href="alumno.php">Alumnos</a>
                                        <li><a href="asignacion.php">Asignaciones</a>
                                                <li><a href="anioacademico.php">Año Academico</a>
                                                    <li><a href="anioacademico.php">Reportes</a>
                        <li class="log-vj ml-lg-5"><a onclick="cerrar()" ><span class="fa fa-user-circle-o" aria-hidden="true"></span>Cerrar Session</a>
                    </ul>
                </nav>
                <!-- //nav --> 
                Usuario: <?php echo $usuario; ?>
            </div>

               
            </div>
            <!-- //nav -->
        </div>
        <!-- //banner -->
    </div>


   
</body>
<script language="JavaScript"> 
function cerrar() 
{ 
var statusConfirm = confirm("¿Deseas Cerrar La Seccion?"); 
if (statusConfirm == true) 
{ 
document.location='control/cerrar.php'; 
} 
} 
</script> 
</html>
