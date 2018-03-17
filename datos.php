<?php

require_once './libs/Smarty.class.php';
require_once './includes/class.Conexion.BD.php';

function getConexion() {
    $cn = new ConexionBD('mysql', 'localhost', 'mascotas', 'root', 'root');
    $cn->conectar();
    return $cn;
}

function getEspecies() {
    $conn = getConexion();
    $conn->consulta('SELECT * FROM especies');
    $especies = $conn->restantesRegistros();
    $conn->desconectar();

    return $especies;
}

function getRazas() {
    $conn = getConexion();
    $conn->consulta('SELECT * FROM razas');
    $razas = $conn->restantesRegistros();
    $conn->desconectar();

    return $razas;
}

function getBarrios() {
    $conn = getConexion();
    $conn->consulta('SELECT * FROM barrios');
    $barrios = $conn->restantesRegistros();
    $conn->desconectar();

    return $barrios;
}

function getPublicaciones() {

    $cn = getConexion();
    $cn->consulta("SELECT * FROM publicaciones LIMIT 10");
    $publicaciones = $cn->restantesRegistros();
    $cn->desconectar();

    return $publicaciones;
}

function getPublicacion($pubId) {
    $cn = getConexion();
    $cn->consulta("SELECT p . * , r.nombre AS raza, e.nombre AS especie
        FROM publicaciones p
        INNER JOIN razas r ON p.raza_id = r.id
        INNER JOIN especies e ON p.especie_id = e.id
        WHERE p.id = :id", array(
        array('id', $pubId, 'int')
    ));
    $pub = $cn->siguienteRegistro();
    $cn->desconectar();

    return $pub;
}

function getPreguntasPublicacion($pubId) {
    $cn = getConexion();
    $cn->consulta("SELECT * FROM preguntas WHERE id_publicacion = :id", array(
        array('id', $pubId, 'int')
    ));
    $preg = $cn->restantesRegistros();
    $cn->desconectar();

    return $preg;
}

function getImagenesPublicacion($pubId) {
    $cn = getConexion();
    $cn->consulta("SELECT * FROM imagenes WHERE id_publicacion = :id", array(
        array('id', $pubId, 'int')
    ));
    $pub = $cn->restantesRegistros();
    $cn->desconectar();

    return $pub;
}

function guardarPublicacion($tit, $desc) {
    $cn = getConexion();
    $cn->consulta("INSERT INTO publicaciones(titulo, descripcion) VALUES(:tit, :desc)", array(
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
        ", array(
        array('catId', $catId, 'int')
    ));

    $total = $cn->siguienteRegistro()['total'] / $porPagina;

    $cn->consulta("
            SELECT * FROM productos 
            WHERE id_categoria = :catId 
            LIMIT :desde, :cantidad
            ", array(
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
    $cn->consulta("INSERT INTO productos(nombre, descripcion, id_categoria) VALUES(:nombre, :descripcion, :catId)", array(
        array('nombre', $nombre, 'string'),
        array('descripcion', $descripcion, 'string'),
        array('catId', $catId, 'int')
    ));
    $id = $cn->ultimoIdInsert();
    $cn->desconectar();
    return $id;
}

function insertarRespuesta($id, $respuesta) {
    $cn = getConexion();
    $cn->consulta("UPDATE preguntas SET respuesta = :respuesta WHERE id = :id", array(
        array('respuesta', $respuesta, 'string'),
        array('id', $id, 'int')
    ));
    $cont = $cn->cantidadRegistros();
    $cn->desconectar();
    return $cont;
}

function hacerPregunta($id, $pregunta, $usuarioId) {
    $cn = getConexion();
    $cn->consulta("INSERT INTO preguntas (id_publicacion, texto, usuario_id) VALUES = (:id, :pregunta, :usuarioId)", array(
        array('id', $id, 'int'),
        array('pregunta', $pregunta, 'string'),
        array('usuarioId', $usuarioId, 'int')
    ));
    $cont = $cn->cantidadRegistros();
    $cn->desconectar();
    return $cont;
}

/*
  Funcion que valida credenciales de un usuario. Ahora lo
  tiene harcoded, luego sera desde la base de datos
 */

function login($usuario, $clave, $recordar) {
    $usuario_logueado = NULL;
    $db = getConexion();

    $myusername = mysqli_real_escape_string($usuario);
    $mypassword = mysqli_real_escape_string($clave);

//    $sql = "SELECT id FROM usuarios WHERE email = '$myusername' and password = '$mypassword'";
//    $result = mysqli_query($db, $sql);
//    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
//    $active = $row['active'];

    $sql = "SELECT COUNT(*) FROM usuarios WHERE email = :email AND password = :password";

    $db->consulta($sql, array(
        array('email', $usuario, 'string'),
        array('password', $clave, 'string')
    ));

    $count = $db->fetchColum();

    // If result matched $myusername and $mypassword, table row must be 1 row
    if ($count == 1) {
        $db->desconectar();
        // session_register("myusername");
        // $_SESSION['login_user'] = $myusername;

        $db = getConexion();
        $sql = "SELECT id, nombre FROM usuarios WHERE email = :email AND password = :password";

        $db->consulta($sql, array(
            array('email', $usuario, 'string'),
            array('password', $clave, 'string')
        ));

        $usuario_logueado = $db->siguienteRegistro();

        if ($recordar) {
            setcookie('recordar', $usuario_logueado['guid'], time() + (60 * 60 * 24), "/");
        }

        // header("location: welcome.php");
    } else {
        $error = "Your Login Name or Password is invalid";
    }

    $db->desconectar();
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
