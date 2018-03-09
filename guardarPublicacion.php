<?php
require_once 'datos.php';

$nombre = $_POST['nombre'];
$descripcion = $_POST['descripcion'];
$catId = $_POST['catId'];
$id = guardarProducto($nombre, $descripcion, $catId);

// ver si vino foto
$foto = $_FILES['imagen'];
if(isset($foto)) {
    $temporal = $foto['tmp_name'];
    $nuevo = "./imagenes/$id";
    move_uploaded_file($temporal, $nuevo );
}
// si vino foto, guardarla con el id como nombre


header('location:index.php?cat=' . $catId);

