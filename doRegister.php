<?php
require_once('datos.php');

$email = $_POST['email'];
$name = $_POST['name'];
$pass = $_POST['pass'];

$usuario_logueado = register($email, $name, $pass);

if(isset($usuario_logueado)){
    // Tomar la sesion
    session_start();
    // guardar el usuario en la sesion
    $_SESSION['usuario'] = $usuario_logueado;
    
     // header('location:./index.php');
    
    echo "Usuario registrdo con exito";
} else {
    echo "El usuario no pudo ser registrado, verifique sus datos.";
     // header('location:./login.php?err=1');
}
