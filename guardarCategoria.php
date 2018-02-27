<?php

require_once 'datos.php';

$nombre = $_POST['nombre'];
guardarCategoria($nombre);

header('location:index.php');
