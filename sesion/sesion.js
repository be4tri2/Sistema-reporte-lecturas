function validarUsuario(mod,op)
{
	if($("#sesionUsuario").val() == ""){
		$("#sesionUsuario").focus();
		$("#mensaje").html("Nombre de Usuario no proporcionado. Inténtelo nuevamente");
	}else if($("#passUsuario").val() == ""){
		$("#passUsuario").focus();
		$("#mensaje").html("Contraseña no proporcionada. Inténtelo nuevamente");
	}else{
		var informacion = "&usuario=" + $("#sesionUsuario").val() + "&pass=" + $("#passUsuario").val();
		$.ajax({
			url: mod + "/" + mod + ".php?op=" + op,
			type: "POST",
      		data: "submit=" + informacion,
			success: function(datos){ 
				$("#mensaje").html(datos);    
			}
		});
	}
}