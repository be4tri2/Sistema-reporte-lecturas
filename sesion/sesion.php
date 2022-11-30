<script src="sesion/sesion.js" type="text/javascript"></script>

<?php
session_start();
require_once("../bd/conexion.php");
class sesion extends conexion{
	function __construct(){
      switch ($_GET["op"]){
        case 'modalInicioSesion': 
        	$this->modalInicioSesion();
        break;
        case 'validarSesion':
            $this->validarSesion();
        break;
      }
	}

	function modalInicioSesion(){
	?>
        <div id="mensaje" class="text-center text-danger"></div>
        <h2 class="modal-title text-center">¡Bienvenido!</h2>
        <div class="contenedor">

            <div class="izquierdo text-center mt-3">
                <form action="moduloUsuario.php" method="POST" name="f1">
                    <div class="row">
                        <div class=" col-md-12">
                            <div class="form-floating mb-3">
                                <input autofocus type="email" class="form-control" id="sesionUsuario"
                                    placeholder="name@example.com" required="required">
                                <label for="floatingInput">Usuario ejemplo@aulavirtual.umar.mx </label>
                            </div>
                        </div>
                    </div>
                    <div class="row ">
                        <div class=" col-md-12">
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="passUsuario"
                                    placeholder="Contraseña" required="required">
                                <label for="floatingInput">Contraseña</label>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-3 col-md-3">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="exampleRadios2">
                                <label class="form-check-label" for="exampleRadios2">
                                    Recordar
                                </label>
                            </div>
                        </div>
                        <div class="col col-md-9 text-end">
                            <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal3">Preregistro</button>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="d-grid gap-2 col-12 ">
                            <button class="btn btn-primary" type="button" onclick="validarUsuario('sesion','validarSesion');">Iniciar sesión</button>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class=" col-md-12">
                            <a href="">¿Olvidaste tu contraseña?</a>
                        </div>
                    </div>
                </form>
            </div>
            <div class="derecho d-none d-sm-none d-md-block text-center mt-3">
                <img src="imagenes/logoUmar.png" height="230px">
            </div>
        </div>                  
	<?php
	}

	function validarSesion(){
        $usuario = $_POST['usuario'];
        $contrasenia = $_POST['pass'];
        $existe = 0;

        $sqlAlumno = parent::getSQL("SELECT * FROM tbl_registro_alumnos al WHERE  al.estado_cuenta = 'AC' AND al.contrasenia = '".$contrasenia."' AND al.correo = '".$usuario."'");
        
        while ( $datosAlumno = parent::resultados($sqlAlumno)) {  
            if($datosAlumno['correo'] == $usuario && $datosAlumno['contrasenia'] == $contrasenia){
                $existe++;
                $_SESSION["idUsuario"]=$datosAlumno['id_alumnos'];
                $_SESSION["tipo"]= "alumno";
                $this->acceso();
            }
        }
        $sqlRevisor = parent::getSQL("SELECT * FROM tbl_revisor rv WHERE  rv.estado_cuenta = 'AC' AND rv.contrasenia = '".$contrasenia."'  AND rv.correo = '".$usuario."'");     
        while ($datosRevisor = parent::resultados($sqlRevisor)) {
            if($datosRevisor['correo'] == $usuario && $datosRevisor['contrasenia'] == $contrasenia){
                if($datosRevisor['tipo_usuario'] == 'AD'){
                    $existe++;
                    $_SESSION["idUsuario"]=$datosRevisor['id_revisor'];
                    $_SESSION["tipo"]= "administrador";
                    $this->acceso();
                } 
                if($datosRevisor['tipo_usuario'] == 'RV'){
                    $existe++;
                    $_SESSION["idUsuario"]=$datosRevisor['id_revisor'];
                    $_SESSION["tipo"]= "revisor";
                    $this->acceso();
                } 
            }
        }

        if($existe == 0){
        ?>
            <script type="text/javascript">$("#mensaje").html("Nombre de Usuario y/o Contraseña inválidos. Inténtelo nuevamente");</script>
        <?php
        }
	}

    function acceso()
    {       
        ?>
            <script>
                window.location="index.php";
            </script>
        <?php   
    }   
}

new sesion();

?>