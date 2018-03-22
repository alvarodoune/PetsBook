<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once './datos.php';

$smarty = nuevoSmarty();

//Cantidad de publicaciones
$smarty->assign('qtyPublicaciones', getQtyPublicaciones());

//Cantidad de publicaciones por tipo
$smarty->assign('qtyPublicacionesXTipo', getQtyPublicacionesXTipo());

//Cantidad de publicaciones por especie
$smarty->assign('qtyPublicacionesXEspecie', getQtyPublicacionesXEspecie());

//Cantidad de publicaciones por estado

$smarty->assign('qtyPublicacionesXEstado', getQtyPublicacionesXEstado());

//Cantidad de publicaciones por resultado
$smarty->assign('qtyPublicacionesXResultado', getQtyPublicacionesXResultado());

$smarty->display('estadisticas.tpl');
