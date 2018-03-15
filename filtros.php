<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once './datos.php';

$filtro = $_POST['filtro'];
$tipo = $_POST['tipo'];
$especie = $_POST['especie'];
$raza = $_POST['raza'];
$barrio = $_POST['barrio'];

/*
 * 
 */
$response = array();

$conn = getConexion();

$sql = "SELECT *";
$sql .= " FROM publicaciones";
$sql .= " WHERE (titulo LIKE '%" . $filtro . "%'";
$sql .= " OR descripcion LIKE '%" . $filtro . "%')";

if ($tipo <> 0) {
    $sql .= " AND tipo = '". $tipo ."'";
}

if ($especie <> 0) {
    $sql .= " AND especie_id = '". $especie ."'";
}

if ($raza <> 0) {
    $sql .= " AND raza_id = '". $raza ."'";
}

if ($barrio <> 0) {
    $sql .= " AND barrio_id = '". $barrio ."'";
}

$parametros = array();

$conn->consulta($sql, $parametros);
$data = $conn->restantesRegistros();  

$response['publicaciones'] = $data;


echo json_encode($response);

//para testing
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

?>