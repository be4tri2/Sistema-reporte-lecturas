<?php
class conexion{
	private $Servidor="localhost";
	private $Usuario="root";
	private $Clave="";
	private $BD="lecturas_suneo";
	
    function conectar(){
		$link = mysqli_connect($this->Servidor, $this->Usuario, $this->Clave, $this->BD);
		if (!$link){
			die('No se pudo conectar a la BD: ');
		}
		//echo 'Conexi�n satisfactoria';

		// $db_selected = mysqli_select_db($this->BD, $link);
		// if (!$db_selected){
		// 	die ('No se pudo seleccionar la BD : ');
		// }

        return $link;
	}
	function desconectar(){
		mysqli_close();
	}	
	function consulta($resultado){
		return mysqli_query($resultado);
	}
	function rows($resultado){
		return mysqli_num_rows($resultado);
	}
	function resultados($resultado){
		return mysqli_fetch_array($resultado, MYSQLI_ASSOC);
	}
	function getDatos($consulta){
		// Conectar con la base de datos
		$this->conectar();
		// Ejecutar la consulta SQL
		$resultado = $this->consulta($consulta);
		// Crear el array de elementos para la capa de la vista
		$datos = array();
		if($this->rows($resultado)>0){
			while($fila = $this->resultados($resultado)){
				$datos[] = $fila;
			}
		}
		return $datos;
	}
	public function getSQL($SQL){
		try{	
			//$this->conectar();		
			$this->SQL = mysqli_query($this->conectar(),$SQL);
			if(!$this->SQL){
				throw new Exception("No se pudo ejecutar la consulta");
			}else{
				return $this->SQL;
			}	
			$this->desconectar();	
		}
		catch(Exception $ex){
			throw new Exception("No se pudo seleccionar la informacion por favor verifique la consulta ejecutada");
		}				
	}
}
?>
