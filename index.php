<?php
require_once './datos.php';

$catId = $_GET['cat'];

if (!isset($catId)) {
    $catId = 1;
}

$miSmarty = nuevoSmarty();
$miSmarty->assign('publicaciones', getPublicaciones());
$miSmarty->display('index.tpl');