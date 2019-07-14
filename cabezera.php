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
    <meta name="keywords" content="EduWily Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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
    <!-- /Fonts -->
    <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">
    <!-- //Fonts -->
</head>

<body>
    <!-- home -->
    <div id="home">
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
                                                    <li><a href="reportes.php">Reportes</a>
                        <li ><a onclick="cerrar()" ><span class="fa fa-user-circle-o" ></span>Cerrar Session</a>
                    </ul>
                </nav>
                <!-- //nav --> 
                Usuario: <?php echo $usuario; ?>
            </div>

        </div>
        <!-- //nav -->
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
