<?php
	include 'plantilla.php';
	require 'conexion.php';
$id = $_GET['cod'];

	$query =" SELECT c.idClase,c.idAsignacionDoc,cu.descr as curso,d.nomDoc,d.apepaDoc,d.apemaDoc,aa.descr as auni,c.fechaClas,c.horClas,c.est,e.descr as estado FROM asistencia.clase c 
join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc 
join curso cu on ad.idCurso=cu.idCurso
join docente d on ad.idDocente=d.idDocente
join anioacademico aa on ad.idAnioAcademico=aa.idAnioAcademico
join estados e on c.est=e.idestados  where c.idClase=$id;";
    
     $sql = "SELECT a.idClase,a.codAlu,concat(al.apepaAlu,' ',al.apemaAlu,' ',al.nomAlu) as alum from asistencia a join alumno al on a.codAlu=al.codAlu where a.idClase=$id  ORDER BY al.apepaAlu asc";
	$rs = $mysqli->query($query);
	while($fila = $rs->fetch_array())
	{$clase=$fila[0];
 $curso=utf8_decode($fila[2]); 
 $docente=utf8_decode($fila[4].' '.$fila[5].' '.$fila[3]);
  $fecha=$fila[7];
   $hora=$fila[8];
	}
	
	$pdf = new PDF();
	$pdf->AliasNbPages();
	$pdf->AddPage();
	$pdf->Ln(10);
	$pdf->SetX(53);
	$pdf->Cell(40,6, 'ID clase: '.$clase,0,1,'C');
	$pdf->SetX(72);
	$pdf->Cell(53,6, 'Curso: '.$curso,0,1,'C');
	$pdf->SetX(65);
	$pdf->Cell(53,6, 'Docente: '.$docente,0,1,'C');
	$pdf->SetX(59);
	$pdf->Cell(54,6, 'Fecha: '.$fecha,0,1,'C');
	$pdf->SetX(58);
	$pdf->Cell(53,6, 'Hora: '.$hora,0,1,'C');
		$pdf->Line(10,70,200,70);
	$pdf->Ln(10);
	$pdf->SetFillColor(232,232,232);
	$pdf->SetX(60);
	$pdf->SetFont('Arial','B',12);
	$pdf->Cell(25,6,'CODIGO',1,0,'C',1);
	$pdf->Cell(55,6,'APELLIDOS Y NOMBRES',1,0,'C',1);
	$pdf->SetX(35);
	$pdf->SetFont('Arial','',10);
	$resultado = $mysqli->query($sql);
	while($row = $resultado->fetch_array())
	{
		$pdf->Ln(6);
		$pdf->SetX(60);
		$pdf->Cell(25,6,$row[1],1,0,'C');
		$pdf->Cell(55,6,utf8_decode($row[2]),1,0,'C');
		
	}
	$pdf->Output();
?>