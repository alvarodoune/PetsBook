<?php

require_once('datos.php');

$errors = array();
$data = array();

$email = $_POST['email'];
$name = $_POST['name'];
$pass = $_POST['pass'];

if (empty($email)) {
    $errors['email'] = 'El mail es requerido.';
}

if (empty($name)) {
    $errors['name'] = 'El nombre es requerido.';
}

if (empty($pass)) {
    $errors['pass'] = 'El password es requerido';
}

if (!empty($errors)) {
    $data['success'] = false;
    $data['errors'] = $errors;
} else {

    $usuario_logueado = register($email, $name, $pass);

    if (isset($usuario_logueado)) {
        $data['success'] = true;
        $data['message'] = 'Success!';
        $data['cont'] = $cont;

        // Tomar la sesion
        session_start();
        // guardar el usuario en la sesion
        $_SESSION['usuario'] = $usuario_logueado;
    } else {
        $data['success'] = false;
        $data['errors'] = 'El usuario no pudo ser registrado, verifique sus datos.';
    }
}

// return all our data to an AJAX call
echo json_encode($data);

