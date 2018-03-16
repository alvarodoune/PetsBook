<?php

require_once './datos.php';

$errors = array();      // array to hold validation errors
$data = array();      // array to pass back data
// validate the variables ======================================================
// if any of these variables don't exist, add an error to our $errors array

$preguntaId = $_POST['id'];
$respuesta = $_POST['respuesta'];

if (empty($respuesta)) {
    $errors['respuesta'] = 'Respuesta is required.';
}

if (empty($preguntaId)) {
    $errors['id'] = 'id is required.';
}

// return a response ===========================================================
// if there are any errors in our errors array, return a success boolean of false
if (!empty($errors)) {
    // if there are items in our errors array, return those errors
    $data['success'] = false;
    $data['errors'] = $errors;
} else {

    $cont = insertarRespuesta($preguntaId, $respuesta);
    
    if($cont > 0) {
        $data['success'] = true;
        $data['message'] = 'Success!';  
        $data['cont'] = $cont;
    }
}

// return all our data to an AJAX call
echo json_encode($data);
