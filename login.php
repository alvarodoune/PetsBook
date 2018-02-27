<?php
require_once 'datos.php';
$miSmarty = nuevoSmarty();

if (isset($_GET['err'])) {
    $miSmarty->assign('err', True);
}

$miSmarty->display('login.tpl');
                
                
            