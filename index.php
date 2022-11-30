<?php
session_start();
class principal{
  function __construct(){
    ?>
    <!doctype html>
      <html lang="es">
      <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Reportes suneo</title>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/estilosTabla.css">
        <link rel="stylesheet" href="css/estilosVistaPublica.css">
        <link rel="stylesheet" href="css/estilos-navbar-header.css">
        <link rel="stylesheet" href="css/estilosVistaPrincipal.css">
        <link rel="stylesheet" href="css/estilosNotificacionesPerfil.css">       
        <link href='https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
        <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="js/funciones.js" type="text/javascript"></script>

      </head>
      <body id="body-pd">
        <div class="container-fluid" id="principal">
          <?php
            if(!isset($_SESSION['tipo'])){
            ?>
              <button type="button" class="btn btn-primary mt-5 " data-bs-toggle="modal" data-bs-target="#InicioSesion" onclick="cargarModal('sesion','modalInicioSesion');">Iniciar sesión</button>
            <?php
            }else{
                $this->navbar();

            }
          ?>
        </div>

        <?php
          $this->modalInicioSesion();
        ?>

      </body>
      </html>

      <?php 
    }

  function modalInicioSesion(){
    ?>
    <div class="modal" tabindex="-1" id="InicioSesion">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content modal-border">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="cuerpo"></div>
            </div>
        </div>
    </div>
  <?php
  }

  function navbar(){
?>
<div class="contenedor-icono-hamburguesa" id="contenedorIconoHamburguesa">
    <i class='bx bx-menu' id="iconoHamburguesa"></i>
</div>

<header class="header" id="header">
    
    <div class="circulo-iconos"></div><!-- div flotante -->

    <div class="header__div-vacio"></div><!-- div-1 -->

    <div class="header__lista-semestres"><!-- div-2 -->
        <select id="" class="form-select lista-semestres__select" aria-label="Default select example" >
            <option selected>Semestre</option>
            <option value="1">Semestre 22-23-A</option>
            <option value="2">Semestre 22-23-B</option>
            <option value="3">Semestre 23-24-A</option>
        </select>
    </div>
    
    <div class="header__navbar-right"><!-- div-3 -->
            <!-- Operaciones básicas de usuario -->
            <div class="navbar-right">
                <ul class="d-flex align-items-center list-inline m-0">
                    
                    <li class="item-notificaciones">
                        <a href="#" class="al search-toggle" id="search-toggle">
                            <i class="bi-bell-fill navbar-right_icono"></i>
                            <span class="bg-danger circulo-notificacion"></span>
                        </a>

                        <div class="iq-sub-dropdown overflow-auto item__modal" id="contenido-notificaciones">

                            <div class="iq-sub-card division">
                                <div class="row align-items-start">
                                    <div class="col-2 col-padless">
                                        <img src="imagenes/documento.png" alt="" class="iq-sub-card__icono img-fluid mr-3" />
                                    </div>
                                    <div class="col-10">
                                        <h6 class="mb-0">11 de Noviembre de 2022</h6>
                                        <small class="contenido-notificacion">Un día para la entrega del reporte</small>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </li>

                    <li class="item-perfilusuario">
                        <a href="#" class="al search-toggle2 d-flex align-items-center p-0" id="search-toggle2">
                            <img src="imagenes/usuario.png" class="navbar-right_icono rounded-circle" />
                        </a>

                        <div class="iq-sub-dropdown item__modal" id="contenido-perfilusuario">

                            <div class="iq-card shadow-none m-0">
                                <div class="iq-card-body p-0 pl-3 pr-3">

                                    <div class="iq-sub-card division">
                                        <div class="centrar-icono">
                                            <img src="imagenes/usuario.png" class="navbar-right_icono rounded-circle" />
                                        </div>
                                        <h6 class="m-1 mt-2 nombre-perfil">
                                            ADRIANA DE JESUS CLEMENTE HERNANDEZ
                                        </h6>
                                    </div>

                                    <!-- <a href="#" class="pt-3 pb-2 al iq-sub-card opciones" data-bs-toggle="modal" data-bs-target="#modalFotoPerfil">
                                        <div class="opciones__contenido">
                                            <i class="bi bi-card-image"></i>
                                            <h6 class="alinear-texto">Actualizar foto de perfil</h6>
                                        </div>
                                    </a>
                                    </button> -->

                                    <a href="#" class="pt-3 pb-2 al iq-sub-card opciones">
                                        <div class="opciones__contenido">
                                            <i class="bi bi-pencil-square"></i>
                                            <h6 class="alinear-texto">Editar perfil</h6>
                                        </div>
                                    </a>

                                    <a href="#" class="pt-3 pb-2 al iq-sub-card opciones">
                                        <div class="opciones__contenido">
                                            <i class="bi bi-box-arrow-in-right"></i>
                                            <h6 class="alinear-texto">Cerrar sesión</h6>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

    </div>
</header>

<div class="contenedor-nav-bar" id="nav-bar">
    <nav class="nav">
        <div>
            <a href="#" class="nav_logo">
                <img src="imagenes/logo-srl.png" alt="" class="img-logo">
            </a>

            <div class="nav_lista-opciones">
                <?php
                $usuario = ($_SESSION['tipo']);

                if ($usuario == "alumno") { ?>

                    <a href="#" class="nav_link nav_link-active" id="opSubirReporte">
                        <img class="nav_icono" src="imagenes/journal-arrow-up.png">
                        <span class="nav_name">Subir reportes</span>
                    </a>
                    <a href="#" class="nav_link" id="opReportesE">
                        <img class="nav_icono" src="imagenes/list-check.png">
                        <span class="nav_name">Reportes entregados</span>
                    </a>
                    <a href="#" class="nav_link" id="opCalendarizacion">
                        <img class="nav_icono" src="imagenes/calendar-week.png">
                        <span class="nav_name">Calendarización de reportes</span>
                    </a>

                <?php } else if ($usuario == "revisor") { ?>

                    <a href="#" class="nav_link nav_link-active">
                        <img class="nav_icono" src="imagenes/clipboard-check.png">
                        <span class="nav_name">Gestionar cuentas de alumnos</span>
                    </a>
                    <a href="#" class="nav_link">
                        <img class="nav_icono" src="imagenes/folder2-open.png">
                        <span class="nav_name">Asignación de alumnos</span>
                    </a>
                    <a href="#" class="nav_link">
                        <img class="nav_icono" src="imagenes/search.png">
                        <span class="nav_name">Revisión</span>
                    </a>
                    <a href="#" class="nav_link">
                        <img class="nav_icono" src="imagenes/book.png">
                        <span class="nav_name">Gestión de informes</span>
                    </a>
                    <a href="#" class="nav_link">
                        <img class="nav_icono" src="imagenes/calendar-week.png">
                        <span class="nav_name">Establecer fechas de entrega</span>
                    </a>
                    <a href="#" class="nav_link">
                        <img class="nav_icono" src="imagenes/file-earmark-text.png">
                        <span class="nav_name">Establecer reporte</span>
                    </a>

                <?php } else { ?>

                    <a href="#" class="nav_link nav_link-active">
                        <img class="nav_icono" src="imagenes/clipboard-check.png">
                        <span class="nav_name">Gestionar cuentas de alumnos</span>
                    </a>
                    <a href="#" class="nav_link" id="">
                        <img class="nav_icono" src="imagenes/gestionarRevisor.png">
                        <span class="nav_name">Gestionar cuentas de revisores</span>
                    </a>
                    <a href="#" class="nav_link">
                        <img class="nav_icono" src="imagenes/gestionarSemestre.png">
                        <span class="nav_name">Gestionar semestre</span>
                    </a>
                    <a href="#" class="nav_link" id="">
                        <img class="nav_icono" src="imagenes/calendar-week.png">
                        <span class="nav_name">Establecer fechas de entrega</span>
                    </a>
                <?php } ?>
            </div>

        </div>

        <a href="http://coralito.umar.mx/BibliotecaDigital/NT.html" target="_blank" class="nav_link">
            <i class='bx bx-log-out bi-link'></i>
            <span class="nav_name">Biblioteca UMAR</span>
        </a>
    </nav>
</div>
<?php
  }

  }
  new principal();
  ?>