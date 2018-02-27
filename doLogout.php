<?php

session_start();
unset($_SESSION['usuario']);
setcookie('recordar', null, -1, '/');
header('location:./index.php');

