<?php
	include 'plantilla2.php';
	require 'conexion.php';
$anio = $_GET['anio'];
$cur= $_POST['cur'];
	$query ="SELECT * FROM asistencia.asignaciondoc ad join docente d on ad.idDocente=d.idDocente
join curso c on ad.idCurso=c.idCurso join anioacademico aa on ad.idAnioAcademico=aa.idAnioAcademico where ad.idCurso='$cur' and ad.idAnioAcademico='$anio' limit 1";
    
     $sql = "SELECT * FROM asistencia.asignacionalu ad join alumno d on ad.codAlu=d.codAlu
join curso c on ad.idCurso=c.idCurso join anioacademico aa on ad.idAnioAcademico=aa.idAnioAcademico where ad.idCurso='$cur' and ad.idAnioAcademico='$anio'
 ORDER BY d.apepaAlu asc";
	$rs = $mysqli->query($query);
	while($fila = $rs->fetch_array())
	{$aniou=$fila[16];
 $curso=utf8_decode($fila[13]); 
 $docente=utf8_decode($fila[7].' '.$fila[8].' '.$fila[6]);
  $fecha=date('d-m-Y');
  $sqlnclase="SELECT count(idClase) FROM asistencia.clase c join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc where ad.idCurso='$cur' and ad.idAnioAcademico='$anio';";
 $clases = $mysqli->query($sqlnclase);
	while($clase = $clases->fetch_array()){
		$nclase=$clase[0];
	}
	}
	

	$pdf = new PDF();
	$pdf->AliasNbPages();
	$pdf->AddPage();
	$pdf->Ln(10);
	$pdf->SetX(53);
	$pdf->Cell(40,6,utf8_decode( 'Año Academido: ').$aniou,0,1,'C');
	$pdf->SetX(72);
	$pdf->Cell(53,6, 'Curso: '.$curso,0,1,'C');
	$pdf->SetX(65);
	$pdf->Cell(53,6, 'Docente: '.$docente,0,1,'C');
	$pdf->SetX(59);
	$pdf->Cell(54,6, 'Fecha de reporte: '.$fecha,0,1,'C');
	$pdf->SetX(58);
	$pdf->Cell(53,6,utf8_decode( 'N° de clases Registradas: ').$nclase,0,1,'C');
		$pdf->Line(10,70,200,70);
	$pdf->Ln(10);
	$pdf->SetFillColor(232,232,232);
	$pdf->SetX(20);
	$pdf->SetFont('Arial','B',12);
	$pdf->Cell(25,6,'CODIGO',1,0,'C',1);
	$pdf->Cell(85,6,'APELLIDOS Y NOMBRES',1,0,'C',1);
	$pdf->Cell(28,6,'C.ASISTIDAS',1,0,'C',1);
	$pdf->Cell(28,6,'DA EXAMEN',1,0,'C',1);
	$pdf->SetX(35);
	$pdf->SetFont('Arial','',10);
	$resultado = $mysqli->query($sql);
	while($row = $resultado->fetch_array())
	{
		$pdf->Ln(6);
		$pdf->SetX(20);
		$pdf->Cell(25,6,$row[1],1,0,'C');
		$pdf->Cell(85,6,utf8_decode($row[7].' '.$row[8].' '.$row[6]),1,0,'C');
		$sqlnasis="SELECT count(a.idClase) FROM asistencia.asistencia a join clase c on a.idClase=c.idClase 
join alumno al on a.codAlu=al.codAlu join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc
where ad.idAnioAcademico='$anio' and ad.idCurso='$cur' and a.codAlu='$row[1]';";
 $asistencias = $mysqli->query($sqlnasis);
	while($asistencia = $asistencias->fetch_array()){
		$nasistencia=$asistencia[0];
	}
	$prom=($nasistencia*100)/$nclase;
		$pdf->Cell(28,6,$nasistencia.'/'.$prom.'%',1,0,'C');
		if($prom>30)
			{$msj='SI';
		$pdf->SetTextColor(0,255,0);
	   }else{$msj='NO';
	   $pdf->SetTextColor(255,0,0);}

		$pdf->Cell(28,6,$msj,1,0,'C');
		$pdf->SetTextColor(0,0,0);

		
	}
	$pdf->Ln(20);
$pdf->Cell(200,6,'_______________________                     	______________________',0,0,'C',0);
$pdf->Ln(5);
	$pdf->Cell(200,6,'Firma Docente                                          Firma Delegado',0,0,'C',0);

	$pdf->Output();
?>