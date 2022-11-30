/**permite abrir y cerrar los modales de notificaciones y perfil de usuario  */
jQuery(document).ready(function () {
  jQuery(document).on("click", function (e) {
    let myTargetElement = e.target;
    let selector;

    if (document.getElementById("search-toggle").contains(e.target)) { //si seleccionó el icono de notificaciones
      selector = jQuery(myTargetElement).parent().parent();
      console.log(selector);
      selector.toggleClass("iq-show");
      $("#contenido-notificaciones").show();
    } else if (document.getElementById("contenido-notificaciones").contains(e.target)) { //significa que presiono en el modal

    }
    else { //significa que presiono en otro lado, menos en el icono de notificaciones
      selector = document.querySelector(".item-notificaciones");
      console.log(selector);
      $(selector).removeClass("iq-show");
    }

    if (document.getElementById("search-toggle2").contains(e.target)) { //si selecciono el icono de perfil
      selector = jQuery(myTargetElement).parent().parent();
      console.log(selector);
      selector.toggleClass("iq-show");
      $("#contenido-perfilusuario").show();
    } else if (document.getElementById("contenido-perfilusuario").contains(e.target)) { //significa que presiono en el modal
    }
    else { //significa que presiono en otro lado, menos en el icono de perfil
      selector = document.querySelector(".item-perfilusuario");
      console.log(selector);
      $(selector).removeClass("iq-show");
    }
    /**
     * Ocultar el nav-bar con tamaño pequeño al puchar fuera
     */
    if (window.innerWidth <= 765) {
      if (document.getElementById("contenedorPrincipal").contains(e.target) || document.getElementById("search-toggle").contains(e.target) || document.getElementById("search-toggle2").contains(e.target)) {
        selector = document.querySelector("#nav-bar");
        console.log(selector);
        $(selector).removeClass("mostrar-nav-bar");
        $(selector).removeClass("recorre-contenedor-nav-bar");

        selector = document.querySelector("#body-pd");
        $(selector).removeClass("agrega-padding-left");

        selector = document.querySelector("#header");
        $(selector).removeClass("agrega-padding-left");

        selector = document.querySelector("#iconoHamburguesa");
        $(selector).removeClass("bx-x");

        selector = document.querySelector("#contenedorIconoHamburguesa");
        $(selector).removeClass("recorre__contenedor-menu-hamburguesa");
      }
    }

  });
});



/**esto es para el body, header y navbar*/
document.addEventListener("DOMContentLoaded", function (event) {

  const showNavbar = (toggleId, navId, bodyId, headerId) => {

    const toggle = document.getElementById(toggleId)
    const nav = document.getElementById(navId)
    const bodypd = document.getElementById(bodyId)
    const headerpd = document.getElementById(headerId)

    // Valida si las variables existen
    if (toggle && nav && bodypd && headerpd) {

      toggle.addEventListener('click', () => {

        if (!esTouch()) {
          //si no está en móvil recorre el contenedor principal y header.
          bodypd.classList.toggle('agrega-padding-left')
          headerpd.classList.toggle('agrega-padding-left')
        } else {
          //de lo contrario solo el ícono de hamburguesa
          document.getElementById('contenedorIconoHamburguesa').classList.toggle('recorre__contenedor-menu-hamburguesa')
        }

        nav.classList.toggle('mostrar-nav-bar')
        nav.classList.toggle('recorre-contenedor-nav-bar')

        //cambia de icono (hamburguesa a x)
        toggle.classList.toggle('bx-x')
      })
    }
  }
  showNavbar('iconoHamburguesa', 'nav-bar', 'body-pd', 'header')

  function esTouch() {
    if ("ontouchstart" in window || window.DocumentTouch && document instanceof DocumentTouch) {
      return true;
    }
  }



  //para verificar que opcion del header selecciono el usuario y asi mostrar el contenido respectivo
  const mostrarContenidoAlumno = (reportesEntregados, calendarizacion, subirReporte, opCalendarizacion, opReportesE, opSubirReporte) => {
    const reportesE = document.getElementById(reportesEntregados),
      calendario = document.getElementById(calendarizacion),
      contenedorSubirReporte = document.getElementById(subirReporte),
      opReportesEn = document.getElementById(opReportesE),
      opCalendario = document.getElementById(opCalendarizacion),
      opSubirR = document.getElementById(opSubirReporte)

    // Validate that all variables exist
    opReportesEn.addEventListener('click', () => {
      reportesE.style.display = "block";
      calendario.style.display = "none";
      contenedorSubirReporte.style.display = "none";
    })

    opCalendario.addEventListener('click', () => {
      calendario.style.display = "block";
      reportesE.style.display = "none";
      contenedorSubirReporte.style.display = "none";
    })

    opSubirR.addEventListener('click', () => {
      contenedorSubirReporte.style.display = "block";
      calendario.style.display = "none";
      reportesE.style.display = "none";
    })
  }


  mostrarContenidoAlumno('reportesEntregados', 'calendarizacion', 'subirReporte', 'opCalendarizacion', 'opReportesE', 'opSubirReporte')

  /*===== LINK ACTIVE =====*/
  const linkColor = document.querySelectorAll('.nav_link')

  function colorLink() {
    if (linkColor) {
      linkColor.forEach(l => l.classList.remove('nav_link-active'))
      this.classList.add('nav_link-active')
    }
  }
  linkColor.forEach(l => l.addEventListener('click', colorLink))

  // Your code to run since DOM is loaded and ready
});

// var myLink = document.querySelector('a[href="#"]');
// myLink.addEventListener('click', function (e) {
//   e.preventDefault();
// });

function cargarModal(mod,op)
{
  $.ajax({
    url: mod + "/" + mod +".php?op=" + op,
    success: function(datos){     
      $("#cuerpo").html(datos);
    }
  });
}
