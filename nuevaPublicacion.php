<?php

require_once './datos.php';

$usuario = getUsuarioLogueado();
if(!isset($usuario)) {
    header('location:login.php');
} else {
    $miSmarty = nuevoSmarty();
    $miSmarty->assign("especies", getEspecies());
    //$miSmarty->assign("razas", getRazas());
    $miSmarty->assign("barrios", getBarrios());
    $miSmarty->display('nuevaPublicacion.tpl');
}
