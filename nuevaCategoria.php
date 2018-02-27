<?php

require_once 'datos.php';

$usuario = getUsuarioLogueado();
if(!isset($usuario)) {
    header('location:login.php');
} else {
    $miSmarty = nuevoSmarty();
    $miSmarty->display('nuevaCategoria.tpl');
}
