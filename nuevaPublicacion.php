<?php

require_once './datos.php';

$usuario = getUsuarioLogueado();
if(!isset($usuario)) {
    header('location:login.php');
} else {
    $miSmarty = nuevoSmarty();
    // $miSmarty->assign("publicaciones", getPublicaciones());
    $miSmarty->display('nuevaPublicacion.tpl');
}
