<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>{$producto.nombre}</title>
        <link rel="stylesheet" type="text/css" href="./css/ventas.css">
    </head>
    <body>
        
        {include file="encabezado.tpl"}
      
        <div id="divContenidoCompleto">
            <h1>{$producto.nombre}</h1>
            <p>
                {$producto.descripcion}
            </p>
        </div>
    </body>
</html>