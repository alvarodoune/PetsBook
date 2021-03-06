<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once './datos.php';

//NOTA: Estas líneas comentadas son para probar la consulta desde el navegador
//$filtro = $_GET['filtro'];
//$tipo = $_GET['tipo'];
//$especie = $_GET['especie'];
//$raza = $_GET['raza'];
//$barrio = $_GET['barrio'];
//
////Paginado
//$from = 0;
//$to = (int)$_GET['cantxpag'];
//$pagina = (int)$_GET['pagina'];
//if ($pagina <= 0) {
//    $pagina = 1;
//}

$filtro = $_POST['filtro'];
$tipo = $_POST['tipo'];
$especie = $_POST['especie'];
$raza = $_POST['raza'];
$barrio = $_POST['barrio'];

//Paginado
$from = 0;
$to = (int)$_POST['cantxpag'];
$pagina = $_POST['pagina'];
if ($pagina <= 0) {
    $pagina = 1;
}
/*
 * 
 */
$response = array();

$sql = "SELECT *";
$sql .= " FROM publicaciones";
$sql .= " WHERE abierto = 1";

if ($filtro != "") {
    $sql .= " AND (titulo LIKE '%" . $filtro . "%'";
    $sql .= " OR descripcion LIKE '%" . $filtro . "%')";
}
if ($tipo != "0") {
    $sql .= " AND tipo = '". $tipo ."'";
}
if ($especie != 0) {
    $sql .= " AND especie_id = '". $especie ."'";
}
if ($raza != 0) {
    $sql .= " AND raza_id = '". $raza ."'";
}
if ($barrio != 0) {
    $sql .= " AND barrio_id = '". $barrio ."'";
}

//$sql .= " AND abierto = 1";

$parametros = array();
$conn = getConexion();
$conn->consulta($sql, $parametros);
$qty = $conn->cantidadRegistros();

$cantPaginas = 0;
if ($to != 0) {
    $from = (($pagina - 1) * $to);
    $sql .= " LIMIT :from, :to";
    $parametros[0] = array('from', $from, 'int', 0);
    $parametros[1] = array('to', $to, 'int', 0);
    $cantPaginas = ceil($qty / $to);
}

$conn->consulta($sql, $parametros);
$data = $conn->restantesRegistros();  

$response['publicaciones'] = $data;
$response['paginas'] = $cantPaginas;

echo json_encode($response);

//Para testing desde el navegador
//echo "<pre>";
//print_r('Tipo: ' . $tipo);
//echo "<pre>";
//print_r('Especie: '.$especie);
//echo "<pre>";
//print_r('Raza:' . $raza);
//echo "<pre>";
//print_r('Barrios:' . $barrio);
//echo "<pre>";
//print_r('SQL: ' . $sql);
//echo "</pre>";
//print_r('Paginado: desde->' . $from . ' hasta->' . $to . ' cantida de registros->' . $qty .' pagina->' . $pagina);
//echo "</pre>";

?>