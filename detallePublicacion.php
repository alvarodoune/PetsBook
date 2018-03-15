<?php

require_once './datos.php';

$pubId = $_GET['id'];
$publicacion = getPublicacion($pubId);


if (empty($publicacion)) {
    echo '<h1 style="color:red">Ha ocurrido un error!</h1>';
} else {
    $miSmarty = nuevoSmarty();
    $miSmarty->assign('publicacion', $publicacion);
    $miSmarty->assign('preguntas', getPreguntasPublicacion($pubId));
    $miSmarty->assign('imagenes', getImagenesPublicacion($pubId));
    $miSmarty->display('detallePublicacion.tpl');
}

