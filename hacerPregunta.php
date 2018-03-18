<?php

require_once './datos.php';

$errors = array();      // array to hold validation errors
$data = array();      // array to pass back data
// validate the variables ======================================================
// if any of these variables don't exist, add an error to our $errors array

$publicacionId = $_POST['id'];
$pregunta = $_POST['pregunta'];
$usuario = $_POST['usuario'];

if (empty($pregunta)) {
    $errors['pregunta'] = 'Pregunta es requerido.';
}

if (empty($publicacionId)) {
    $errors['id'] = 'id es requerido.';
}

if (empty($usuario)) {
    $errors['usuario'] = 'usuario es requerido.';
}

// return a response ===========================================================
// if there are any errors in our errors array, return a success boolean of false
if (!empty($errors)) {
    // if there are items in our errors array, return those errors
    $data['success'] = false;
    $data['errors'] = $errors;
} else {
    $cont = hacerPregunta($publicacionId, $pregunta, $usuario);
    
    if($cont > 0) {
        $data['success'] = true;
        $data['message'] = 'Success!';  
        $data['cont'] = $cont;
    } else {
        $errors['insert'] = 'el insert fallo';
        $data['errors'] = $errors;
    }
}

// return all our data to an AJAX call
echo json_encode($data);
