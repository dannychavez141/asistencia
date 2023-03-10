var idanio = document.getElementById("anio").value;
var iddoc = document.getElementById("doc").value;
console.log(idanio+"-"+iddoc);
$(buscar_datos(idanio,iddoc));

function buscar_datos(anio,doc){
	$.ajax({
		url: 'buscarCasignados.php' ,
		type: 'POST' ,
		dataType: 'html',
		data: {anio:anio,doc:doc},
	})
	.done(function(respuesta){
		$("#datos").html(respuesta);
	})
	.fail(function(){
		console.log("error");
	});
}


function buscar(e) { // 1
var idanio = document.getElementById("anio").value;
var iddoc = document.getElementById("doc").value;
	console.log(idanio+"-"+iddoc);
buscar_datos(idanio,iddoc);
	
}