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

if (is_uploaded_file($imagen['tmp_name'])) {
    $nuevoNombre = "./imagenes/publicaciones/" . $imagen['name'];
    if (move_uploaded_file($imagen['tmp_name'], $nuevoNombre)) {
        $usuFoto = $nuevoNombre;
        // hacer el insert de la publicacion en la base
        $id = guardarPublicacion($desc, $tipo, $especie, $raza, $barrio, $titulo, $imagen['name'], $usuario['id']);

        if ($id > 0) {
            // si tengo mas fotos opcionales
            //$files = array_filter($_FILES['upload']['name']); something like that to be used before processing files.
            // Count # of uploaded files in array
            $total = count($_FILES['upload']['name']);

            // Loop through each file
            for ($i = 0; $i < $total; $i++) {
                //Get the temp file path
                $tmpFilePath = $_FILES['upload']['tmp_name'][$i];

                //Make sure we have a filepath
                if ($tmpFilePath != "") {
                    //Setup our new file path
                    $newFilePath = "./imagenes/publicaciones/" . $_FILES['upload']['name'][$i];

                    //Upload the file into the temp dir
                    if (move_uploaded_file($tmpFilePath, $newFilePath)) {
                        //Inserto en tabla imagenes
                        
                    }
                    insertarImagen($id, $_FILES['upload']['name'][$i]);
                }
            }
        } else {
            header('location:index.php?error="1"');
        }
    } else {
        die("Error al procesar archivo");
    }
} else {
    die("Error al subir archivo");
}

header('location:index.php');


