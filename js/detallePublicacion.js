/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(inicializar);

function inicializar(){
    $('#print').click(function(){
        $.ajax({
            url: 'imprimir.php',
            type: 'POST',
            dataType: 'json',
            data: {}
        });
    });
}

