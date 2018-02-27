<?php
require_once 'datos.php';

$catId = $_GET['cat'];
$pagina = $_GET['pag'];

if (!isset($catId)) {
    $catId = 1;
}

if (!isset($pagina)) {
    $pagina = 1;
}

$objetos = array();
$productos = getProductos($catId, $pagina);

foreach($productos['objetos'] as $producto){
    
    $id = $producto['id'];
    if(file_exists("./imagenes/$id")) {
        $producto['imagen'] = "./imagenes/". $id;
    } else {
        $producto['imagen'] = "./imagenes/defecto.png";
    }
    
    $objetos[] = $producto;
    
}

$miSmarty = nuevoSmarty();
$miSmarty->assign('categoria', getCategoria($catId));
$miSmarty->assign('productos', $objetos);
$miSmarty->assign('mostrarAnterior', $pagina > 1);
$miSmarty->assign('mostrarSiguiente', $pagina < $productos['total']);
$miSmarty->assign('total', $productos['total']);
$miSmarty->display('contenido.tpl');
