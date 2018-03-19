<?php

require_once 'datos.php';

$especie = $_POST['especie'];
$tipo = $_POST['tipo'];
$desc = $_POST['desc'];
$raza = $_POST['raza'];
$barrio = $_POST['barrio'];
$titulo = $_POST['titulo'];
$imagen = $_FILES['imagen'];

$usuario = getUsuarioLogueado();

echo "fecha: ".date('Y-m-d');

//echo "especie " . $especie;
//echo ",tipo " . $tipo;
//echo ",desc " . $desc;
//echo ",raza" . $raza;
//echo ",barrio " . $barrio;
//echo ",titulo " . $titulo;
//echo ",imagen " . $imagen;
//echo ",usuario " . $usuario['id'];

//var_dump($imagen);

if (is_uploaded_file($imagen['tmp_name'])) {
    $nuevoNombre = "./imagenes/publicaciones/" . $imagen['name'];
    if (move_uploaded_file($imagen['tmp_name'], $nuevoNombre)) {
        $usuFoto = $nuevoNombre;
        // hacer el insert de la publicacion en la base
        $id = guardarPublicacion($desc, $tipo, $especie, $raza, $barrio, $titulo, $imagen['name'], $usuario['id']);
        
        if ($id > 0) {
            header('location:index.php');
        } else {
            header('location:index.php?error="1"');
        }
    } else {
        die("Error al procesar archivo");
    }
} else {
    die("Error al subir archivo");
}


