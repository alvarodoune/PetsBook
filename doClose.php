<?php

require_once('datos.php');

$errors = array();
$data = array();

$idPub = $_POST['idPub'];
$exitoso = $_POST['exitoso'];

if (empty($idPub)) {
    $errors['id'] = 'El id es requerido.';
}

if (!empty($errors)) {
    $data['success'] = false;
    $data['errors'] = $errors;
} else {

    $cont = closePub($idPub, $exitoso);

    if ($cont > 0) {
        $data['success'] = true;
        $data['message'] = 'Success!';
        $data['cont'] = $cont;
    } else {
        $data['success'] = false;
        $data['errors'] = "error";
    }
}

// return all our data to an AJAX call
echo json_encode($data);

