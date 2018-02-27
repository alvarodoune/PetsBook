<!DOCTYPE html>
<html>
    <head>
        <title>PetsBook</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="./css/ventas.css">
        <script src="./js/jquery-3.2.1.min.js"></script>
        <script src="./js/index.js"></script>
    </head>
    <body>
        {include file="./encabezado.tpl"}
        <div id="divCategorias">
            <h1>Publicaciones</h1>
            <ul>
                {foreach from=$publicaciones item=pub}
                    <li>
                        <a href="#" class="link-categoria" publicacion="{$pub.id}">
                            {$pub.titulo}
                        </a>
                    </li>
                {/foreach}
            </ul>
        </div>
        <div id="divContenido">

        </div>
    </body>
</html>
