<?php
require_once 'datos.php';

$id = $_GET['id'];
$producto = getProducto($id);

$miSmarty = nuevoSmarty();
$miSmarty->assign('producto', $producto);
$miSmarty->display('productos.tpl');

