<?php

require_once 'datos.php';

$especie = $_POST['especie'];
$raza = $_POST['raza'];
$barrio = $_POST['barrio'];
$titulo = $_POST['titulo'];
$imagen = $_FILES['imagen'];

//var_dump($imagen);

if (is_uploaded_file($imagen['tmp_name'])) {
    $nuevoNombre = "./imagenes/publicaciones/".$imagen['name'];
    if (move_uploaded_file($imagen['tmp_name'], $nuevoNombre)) {
        $usuFoto = $nuevoNombre;
        // hacer el insert de la publicacion en la base
    } else {
        die("Error al procesar archivo");
    }
} else {
    die("Error al subir archivo");
}

header('location:index.php');

