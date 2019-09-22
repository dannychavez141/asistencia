
var idanio = document.getElementById("anio").value;
var idcur = document.getElementById("cur").value;

$(buscar_datos("",idanio,idcur));

function buscar_datos(consulta,anio,cur){
	$.ajax({
		url: 'buscalistaasistencia.php' ,
		type: 'POST' ,
		dataType: 'html',
		data: {consulta: consulta,anio:anio,cur:cur},
	})
	.done(function(respuesta){
		$("#datos").html(respuesta);
	})
	.fail(function(){
		console.log("error");
	});
}


$(document).on('keyup','#caja_busqueda', function(){
	var idanio = document.getElementById("anio").value;
    var idcur = document.getElementById("cur").value;
	var valor = $(this).val();
	if (valor != "") {
		buscar_datos(valor,idanio,idcur);
	}else{
		buscar_datos();
	}
});

function buscar(e) { // 1
var idanio = document.getElementById("anio").value;
var idcur = document.getElementById("cur").value;
var valor = document.getElementById("caja_busqueda").value;
	console.log(idanio+"-"+idcur);
buscar_datos(valor,idanio,idcur);
	
}