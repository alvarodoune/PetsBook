<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once './datos.php';
require_once 'fpdf/fpdf.php';

$id = $_GET['id'];
$data = getPublicacion($id);
$images = getImagenesPublicacion($id);

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',12);
$pdf->Cell(40,10, utf8_decode('Detalle de la publicación'));
$pdf->Ln();

$pdf->SetFont('Arial','B',10);
$pdf->Cell(40,10,utf8_decode('Publicación nro: ' . $id));
$pdf->Ln();
$pdf->Cell(40,10,utf8_decode('Fecha de publicación: ' . $data['fechaPublicado']));
$pdf->Ln();
$pdf->Cell(40,10,'Raza: ' . $data['raza']);
$pdf->Ln();
$pdf->Cell(40,10,'Especie: ' . $data['especie']);
$pdf->Ln();
$pdf->Cell(40,10,utf8_decode('Descripción:'));
$pdf->Ln();
$pdf->MultiCell(0,5, utf8_decode($data['descripcion']));
$pdf->Ln();
$pdf->Cell(40,10,utf8_decode('Imágenes de la publicación:'));
$pdf->Ln();
foreach ($images as $image){
    $pdf->Image('imagenes/publicaciones/' . $image['image'], $x, $y, 50, 50);
    $pdf->Ln();
}

$pdf->Output();

?>
