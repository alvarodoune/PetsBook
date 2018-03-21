<!DOCTYPE html>
<html>

    <head>
        <title>PetsBook</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="./css/ventas.css">
        <script src="./js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="./libs/open-iconic-master/font/css/open-iconic-bootstrap.css" rel="stylesheet">
    </head>

    <body>
        <div class="header">
            {include file="./encabezado.tpl"}
        </div>
        <div>
            <h1>Estadísticas</h1>
            <p>Cantidad de publicaciones: {$qtyPublicaciones.qty}</p>
            <p>Cantidad de publicaciones por tipo</p>
            {foreach from=$qtyPublicacionesXTipo item=data}
                {if $data.tipo == "E"}
                    <p>Encontradas: {$data.qty}</p>
                {else}
                    <p>Perdidas: {$data.qty}</p>
                {/if}
            {/foreach}
            <p>Cantidad de publicaciones por especie</p>
            {foreach from=$qtyPublicacionesXEspecie item=data}
                <p>{$data.especie}: {$data.qty}</p>
            {/foreach}
            <p>Cantidad de publicaciones por estado</p>
            {foreach from=$qtyPublicacionesXEstado item=data}
                {if $data.abierto == 0}
                    <p>Cerradas: {$data.qty}</p>
                {else}
                    <p>Abiertas: {$data.qty}</p>
                {/if}
            {/foreach}
            <p>Cantidad de publicaciones agrupadas por resultado</p>
            {foreach from=$qtyPublicacionesXResultado item=data}
                {if $data.exitoso == 0}
                    <p>Resultado negativo: {$data.qty}</p>
                {else}
                    <p>Resultado exitoso: {$data.qty}</p>
                {/if}
            {/foreach}
        </div>
    </body>
</html>