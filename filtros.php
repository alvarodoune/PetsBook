<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once './datos.php';

$filtro = $_POST['filtro'];

/*
 * 
 */
$response = array();

$conn = getConexion();

$sql = "SELECT *";
$sql .= " FROM publicaciones";
$sql .= " WHERE (titulo LIKE '%" . $filtro . "%'";
$sql .= " OR descripcion LIKE '%" . $filtro . "%')";

$parametros = array();

$conn->consulta($sql, $parametros);
$data = $conn->restantesRegistros();  

$response['publicaciones'] = $data;


echo json_encode($response);

//para testing
//echo "<pre>";
//print_r($respuesta);
//echo "</pre>";

?>