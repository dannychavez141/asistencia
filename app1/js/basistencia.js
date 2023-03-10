var idc = document.getElementById("caja_id").value;
var valor="";
$(buscar_datos(valor,idc));

console.log(idc);
function buscar_datos(consulta,id){
	$.ajax({
		url: 'buscarasistencia.php' ,
		type: 'POST' ,
		dataType: 'html',
		data: {consulta: consulta,id: idc},
	})
	.done(function(respuesta){
		$("#datos").html(respuesta);
	})
	.fail(function(){
		console.log("error");
	});
}

$(document).on('keyup','#caja_busqueda', function(){
	valor = $(this).val();
	if (valor != "") {
		buscar_datos(valor,idc);
	}else{
		buscar_datos(valor,idc);
	}
});