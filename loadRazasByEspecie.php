<?php

require_once './datos.php';

$especie = $_POST['especie'];

//$response = array();

$sql = "SELECT *";
$sql .= " FROM razas";
$sql .= " WHERE especie_id = :especie";

$parametros = array();
$conn = getConexion();
$conn->consulta($sql, array(
    array('especie', $especie, 'int')
));

$qty = $conn->cantidadRegistros();
$data = $conn->restantesRegistros();

//$response['especies'] = $data;

echo json_encode($data);
