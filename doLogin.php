<?php
require_once('datos.php');

$usuario = $_POST['usuario'];
$clave = $_POST['clave'];
$recordar = $_POST['recordar'];

$usuario_logueado = login($usuario, $clave, $recordar);

if(isset($usuario_logueado)){
    
    // Tomar la sesion
    session_start();
    // guardar el usuario en la sesion
    $_SESSION['usuario'] = $usuario_logueado;
    
    header('location:./index.php');
} else {
    header('location:./login.php?err=1');
}
