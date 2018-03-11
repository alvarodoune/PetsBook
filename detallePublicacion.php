<?php

require_once './datos.php';

$id = $_GET['id'];
$publicacion = getPublicacion($id);

if (empty($publicacion)) {
    echo '<h1 style="color:red">Ha ocurrido un error!</h1>';
} else {
    $miSmarty = nuevoSmarty();
    $miSmarty->assign('publicacion', $publicacion);
    $miSmarty->display('detallePublicacion.tpl');
}

