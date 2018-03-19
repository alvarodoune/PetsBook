<?php
require_once 'datos.php';

$especie = $_POST['especie'];
$raza = $_POST['raza'];
$barrio = $_POST['barrio'];
$titulo = $_POST['titulo'];
//$imagen = $_POST['imagen'];

// ver si vino foto
$imagen = $_FILES['imagen'];

if(isset($imagen)) {
    $temporal = $imagen['tmp_name'];
    $nuevo = "./imagenes/$id";
    move_uploaded_file($temporal, $nuevo );
}

echo json_encode($imagen);

//header('location:index.php?cat=' . $catId);

