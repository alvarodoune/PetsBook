<?php
require_once './datos.php';

$miSmarty = nuevoSmarty();
$miSmarty->assign('publicaciones', getPublicaciones());
$miSmarty->assign('especies', getEspecies());
$miSmarty->assign('razas', getRazas());
$miSmarty->assign('barrios', getBarrios());
$miSmarty->display('index.tpl');