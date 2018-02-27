<?php

require_once './libs/Smarty.class.php';
require_once './includes/class.Conexion.BD.php';

function getConexion() {
    $cn = new ConexionBD('mysql', 'localhost', 
            'mascotas', 'root','root');
    $cn->conectar();
    return $cn;
}

function getPublicaciones() {
    
    $cn = getConexion();
    $cn->consulta("SELECT * FROM publicaciones");
    $publicaciones = $cn->restantesRegistros();
    $cn->desconectar();
    
    return $publicaciones;
}

function getPublicacion($pubId) {
    $cn = getConexion();
    $cn->consulta("SELECT * FROM publicaciones WHERE id = :id",
            array(
                array('id', $pubId, 'int')
            ));
    $categoria = $cn->siguienteRegistro();
    $cn->desconectar();
    
    return $categoria;
}

function guardarPublicacion($tit, $desc) {
    $cn = getConexion();
    $cn->consulta("INSERT INTO publicaciones(titulo, descripcion) VALUES(:tit, :desc)",
            array(
                array('titulo', $tit, 'string'),
                array('descricion', $desc, 'string')
            ));
    $cn->desconectar();
}


function getProductos($catId, $pagina = 1) {
   
    $porPagina = 3;
    $desde = ($pagina - 1) * $porPagina;
    
    $cn = getConexion();
    $cn->consulta("
        SELECT count(*) as total 
        FROM productos
        WHERE id_categoria = :catId 
        ",
        array(
            array('catId', $catId, 'int')
        ));
    
    $total = $cn->siguienteRegistro()['total'] / $porPagina;
    
    $cn->consulta("
            SELECT * FROM productos 
            WHERE id_categoria = :catId 
            LIMIT :desde, :cantidad
            ",
            array(
                array('catId', $catId, 'int'),
                array('desde', $desde, 'int'),
                array('cantidad', $porPagina, 'int'),
            ));
    $productos = $cn->restantesRegistros();
    $cn->desconectar();
    
    return array(
        'total' => $total,
        'objetos' => $productos
    );
}

// obtiene un producto por id
function getProducto($id) {
    $producto = null;
    foreach (getPublicaciones() as $publicacion) {
        foreach (getProductos($publicacion['id']) as $aux) {
            if ($aux['id'] == $id) {
                $producto = $aux;
            }
        }
    }
    return $producto;
}

function guardarProducto($nombre, $descripcion, $catId) {
    $cn = getConexion();
    $cn->consulta("INSERT INTO productos(nombre, descripcion, id_categoria) VALUES(:nombre, :descripcion, :catId)",
            array(
                array('nombre', $nombre, 'string'),
                array('descripcion', $descripcion, 'string'),
                array('catId', $catId, 'int')
            ));
    $id = $cn->ultimoIdInsert();
    $cn->desconectar();
    return $id;
}


/*
  Funcion que valida credenciales de un usuario. Ahora lo
  tiene harcoded, luego sera desde la base de datos
 */

function login($usuario, $clave, $recordar) {
    $usuario_logueado = NULL;
    if ($usuario == 'test' && $clave == 'test') {
        $usuario_logueado = array(
            'id' => 1,
            'login' => 'test',
            'nombre' => 'Usuario de prueba',
            'guid' => '123456789ABCDEF123456'
        );

        if ($recordar) {
            setcookie('recordar', $usuario_logueado['guid'], time() + (60 * 60 * 24), "/");
        }
    }

    return $usuario_logueado;
}

function buscarUsuarioPorGuid($guid) {
    $usuario = NULL;
    if ($guid == '123456789ABCDEF123456') {
        $usuario = $usuario_logueado = array(
            'id' => 1,
            'login' => 'test',
            'nombre' => 'Usuario de prueba',
            'guid' => '123456789ABCDEF123456'
        );
    }
    return $usuario;
}

// funcion que devuelve el usuario logueado
// lo busca en la sesion
// y si no esta, en cookies
function getUsuarioLogueado() {
    $usuario = NULL;
    session_start();
    if (isset($_SESSION['usuario'])) {
        $usuario = $_SESSION['usuario'];
    } else {
        if (isset($_COOKIE['recordar'])) {
            $usuario = buscarUsuarioPorGuid($_COOKIE['recordar']);
            $_SESSION['usuario'] = $usuario;
        }
    }

    return $usuario;
}

// Crea un objeto de smarty, lo configura
// y lo devuelve
function nuevoSmarty() {
    $miSmarty = new Smarty();
    $miSmarty->template_dir = "templates";
    $miSmarty->compile_dir = "templates_c";
    $miSmarty->cache_dir = "cache";
    $miSmarty->config_dir = "config";
    $miSmarty->assign('usuario', getUsuarioLogueado());
    return $miSmarty;
}
