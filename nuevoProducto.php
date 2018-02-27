<?php

//ini_set("display_errors", 1);

require_once './datos.php';

$usuario = getUsuarioLogueado();
if(!isset($usuario)) {
    header('location:login.php');
} else {
    $miSmarty = nuevoSmarty();
    $miSmarty->assign("publicaciones", getPublicaciones());
    $miSmarty->display('nuevoProducto.tpl');
}