<?php 
$anio=$_POST['anio'];
$curso=$_POST['curso'];
//echo "".$anio."".$curso;

$cantidad=0;
 include_once'./conexion.php'; 

 $url="SELECT a.codAlu,concat(al.nomAlu,' ',al.apepaAlu,' ',al.apemaAlu) as alumno,cu.descr FROM asistencia  a 
join clase c on a.idClase=c.idClase
join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc
join curso cu on ad.idCurso=cu.idCurso
join alumno al on a.codAlu=al.codAlu
where cu.idCurso='$curso' and ad.idAnioAcademico='$anio' GROUP BY a.codAlu";
                         $clase= $mysqli->query($url);
                        while ($fila = $clase->fetch_array()) {
                         $cursos[]=$fila[1];
                         $cantidad++;
                         $id[]=$fila[0];
                         $cur=$fila[2];
                    }

                    foreach ($id as $ids) {
                    	//echo $ids;
   $url="SELECT count(a.idClase) as alumno FROM asistencia  a 
join clase c on a.idClase=c.idClase
join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc
join curso cu on ad.idCurso=cu.idCurso
join alumno al on a.codAlu=al.codAlu
where cu.idCurso='$curso' and ad.idAnioAcademico='$anio' and a.codAlu='$ids';";
                         $clase= $mysqli->query($url);
                        while ($fila = $clase->fetch_array()) {
                         $contado[]=$fila[0];
                        // echo $fila[0];

                    }
                    }
 ?>

<!DOCTYPE html>
<html lang="en-US">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Grafico Estastico 2</title>
	<link rel="stylesheet" type="text/css" href="./jschar/samples/style.css">
	<script src="./jschar/Chart.min.js"></script>
	<script src="./jschar/samples/utils.js"></script>
</head>
<body>
	<center><h1>GRAFICO ESTADISTICO DE CANTIDAD DE ASISTENCIA DE ALUMNOS POR CURSO</h1></center>
	<div class="content">

		<div class="wrapper"><canvas id="chart-0"></canvas></div>
		<div class="toolbar">
			
		</div><table border="1" style="position:absolute;top:100px;left:15px;" >
			<tr><td colspan="2" align="center" style="font-size:10px;">LEYENDA</td></tr>
			<tr><td colspan="2" align="center" style="font-size:10px;"><?php echo $cur ?></td></tr>
				<tr>
					<td align="center" style="font-size:10px;">ALUMNOS</td>
					<td style="font-size:10px;">N° DE ASISTENCIAS</td>
				</tr>
				<?php for ($i=0; $i < count($cursos) ; $i++) { 
					
				 ?>
				<tr>
					<td align="center" style="font-size:10px;"><?php echo $cursos[$i] ?></td>
					<td align="center" style="font-size:10px;"><?php echo $contado[$i] ?></td>
				</tr>
			<?php } ?>
			</table>
	</div>

	<script>
		var listacursos=[];
		var nclases=[];
      <?php  foreach ($cursos as $variable) {
                    	

                     ?>
                    // console.log('<?php echo $variable; ?>');
                     listacursos.push('<?php echo $variable; ?>');

                <?php } ?>
                <?php  foreach ($contado as $variable) {
                    	

                     ?>
                    // console.log('<?php echo $variable; ?>');
                     nclases.push('<?php echo $variable; ?>');

                <?php } ?>


		var DATA_COUNT = <?php echo $cantidad ?>;

		var utils = Samples.utils;

		utils.srand(110);

		function colorize(opaque, ctx) {
			var v = ctx.dataset.data[ctx.dataIndex];
			var c = v < -5 ? '#D60000'
				: v < 0 ? '#F46300'
				: v < 5 ? '#0358B6'
				: '#44DE28';

			return opaque ? c : utils.transparentize(c, 1 - Math.abs(v / 25));
		}
		var data = {
			labels: listacursos,
			datasets: [{
				data:  nclases
			}]
		};

		var options = {
			legend: false,
			tooltips: false,
			elements: {
				rectangle: {
					backgroundColor: colorize.bind(null, false),
					borderColor: colorize.bind(null, true),
					borderWidth: 2
				}
			}
		};

		var chart = new Chart('chart-0', {
			type: 'bar',
			data: data,
			options: options
		});

		
	</script>
</body>
</html>
