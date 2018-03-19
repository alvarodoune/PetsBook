<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once './datos.php';
require_once 'fpdf/fpdf.php';

$id = $_GET['id'];

$sql = "SELECT * FROM publicaciones WHERE id = :id";
$parametros = array();
$parametros[0] = array('id', $id, 'int', 0);

$conn = getConexion();
$conn->consulta($sql, $parametros);

$result = $conn->siguienteRegistro();

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',12);
$pdf->Cell(40,10,'Detalle de la publicacion');

$pdf->SetFont('Arial','B',10);
$pdf->Cell(40,20,'Publicacion nro: ' . $id);
$pdf->Cell(40,30,'Raza: ' . $result['raza_id']);
$pdf->Cell(40,40,'Especie: ' . $result['especie_id']);
$pdf->Cell(40,50,'Descrpcion: ' . $result['descripcion']);

$pdf->Output();

?>
