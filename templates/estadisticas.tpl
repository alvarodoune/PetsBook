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
        <div class="container">
            <div class="header">
                {include file="./encabezado.tpl"}
            </div>
            <div>
                <h1>Estadísticas</h1>
                <p>Cantidad de publicaciones: {$qtyPublicaciones.qty}</p>
                <p>Cantidad de publicaciones por tipo</p>
                <ul>
                    {foreach from=$qtyPublicacionesXTipo item=data}
                    {if $data.tipo == "E"}
                        <li>Encontradas: {$data.qty}</li>
                    {else}
                        <li>Perdidas: {$data.qty}</li>
                    {/if}
                {/foreach}
                </ul>
                <p>Cantidad de publicaciones por especie</p>
                <ul>
                {foreach from=$qtyPublicacionesXEspecie item=data}
                    <li>{$data.especie}: {$data.qty}</li>
                {/foreach}
                </ul>
                <p>Cantidad de publicaciones por estado</p>
                <ul>
                {foreach from=$qtyPublicacionesXEstado item=data}
                    {if $data.abierto == 0}
                        <li>Cerradas: {$data.qty}</li>
                    {else}
                        <li>Abiertas: {$data.qty}</li>
                    {/if}
                {/foreach}
                </ul>
                <p>Cantidad de publicaciones agrupadas por resultado</p>
                <ul>
                {foreach from=$qtyPublicacionesXResultado item=data}
                    {if $data.exitoso == 0}
                        <li>Resultado negativo: {$data.qty}</li>
                    {else}
                        <li>Resultado exitoso: {$data.qty}</li>
                    {/if}
                {/foreach}
                </ul>
            </div>
        </div>
    </body>
</html>