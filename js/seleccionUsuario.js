var campoPrueba = document.getElementById("tipoUsuario");
var formRevisor = document.getElementById("formularioRevisor");
var formAlumno = document.getElementById("formularioAlumno");
var botonEditarRevisor = document.getElementById("botonEditarRevisor");
var campoTexto = document.getElementById("campoTexto");

botonEditarRevisor.addEventListener("click", function(){
  if (campoTexto.className == "col-12 d-none") {
    campoTexto.className = "col-12"
  } else{
    campoTexto.className = "col-12 d-none"
  }
});


var comboSeleccionUsuario = document.getElementById("exampleSelect");
comboSeleccionUsuario.addEventListener('change', 
  function() {
    var opcionSeleccionada = this.options[comboSeleccionUsuario.selectedIndex];
    if (opcionSeleccionada.text == "Revisor") {
      campoPrueba.innerHTML = formRevisor.innerHTML;
    } else {
      campoPrueba.innerHTML = formAlumno.innerHTML;
    }
});

