
<!DOCTYPE html>
<head>
	<?php error_reporting(0);
session_start();
if (isset($_SESSION['usuario'])) {
	header("Location: index.php");
	exit();
	header("Location: login.php");
	exit();
}
$usuario=$_SESSION['usuario'];
$idusuario=$_SESSION['idUsuario'];

$ms=$_GET['msj'];
 	if ($ms==true) {
 echo "<script>alert('EL ACCESO O LA CONTRASEÑA SON ERRONEOS');</script>"; 

}
		
		?>
	<title>Asistencia</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Startup Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script>
		addEventListener("load", function () {
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
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //Custom-Files -->

	<!-- Web-Fonts -->
	<link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext"
	 rel="stylesheet">
	<!-- //Web-Fonts -->
</head>
<body>
			
		<div class="banner_w3lspvt-2">
			<ol class="breadcrumb">
				
			</ol>
		</div>
		
	<center>
	<!-- contact --><h3 >ACCESO AL SISTEMA</h3>
	<h3 >DE ASISTENCIA</h3>

	<div class="contact py-5" id="contact">
		<div class="container pb-xl-5 pb-lg-3">
			
		
					
				<div class="col-lg-6 mt-lg-0 mt-5">
				
					<div class="contact-top1">
						<form action='control/validar.php' method="post" class="contact-wthree-do">
						<center>	<div class="form-group">
							
									<div class="col-md-7">
										<label>
											ACCESO:
										</label>
										<input class="form-control" type="text" maxlength="15" placeholder="Ingrese Acceso" name="txtusuario" required="">
									</div>
									
								
								
									<div class="col-md-7">
										<label>
											CONTRASEÑA:
										</label>
										<input class="form-control" type="password" maxlength="15" placeholder="Ingrese Contraseña" name="txtpass" required="">
									</div>
									<br>
								
								
									<a href=""><button type="button" class="btn btn-danger">Limpiar</button></a> 
									<button type="submit" class="btn btn-primary" name="login">ENTRAR</button>
								
							</div>
						
								
							</div>
							</center>
						</form>
					</div>
					<!-- //contact form grid ends here -->
				</div>
			
			
		</div>
	</div></center>
	<script language="JavaScript"> 
function guardar() 
{ 
var statusConfirm = confirm("¿Deseas guardar?"); 
if (statusConfirm == true) 
{ 
document.forma.action='cdocente.php'; 
document.forma.submit(); 
} 
} 
</script> 
 <script type="text/javascript">
                    function esInteger(e) {
var charCode 
charCode = e.keyCode 
status = charCode 
if (charCode > 31 && (charCode < 48 || charCode > 57)) {
return false
}
return true
}
function numeros(nu) { // 1
tecla = (document.all) ? e.keyCode : e.which; // 2
if (tecla==8) return true; // 3
ppatron = /\d/; // Solo acepta números// 4
te = String.fromCharCode(tecla); // 5
return patron.test(te); // 6
}
function validar(e) { // 1
tecla = (document.all) ? e.keyCode : e.which; // 2
if (tecla==8) return true; // 3
patron =/[A-Za-z\s]/; // 4
te = String.fromCharCode(tecla); // 5
return patron.test(te); // 6
}
                </script>

</body>

</html>