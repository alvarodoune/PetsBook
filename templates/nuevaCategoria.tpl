<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Nueva Categoria</title>
        <link rel="stylesheet" type="text/css" href="./css/ventas.css">
    </head>
    <body>
        
        {include file="encabezado.tpl"}
      
        <div id="divContenidoCompleto">
            <form method="POST" action="./guardarCategoria.php">
                <p> Nombre
                    <input type="text" name="nombre">
                </p>
                <p>
                    <input type="submit" value="Guardar">
                </p>
            </form>
        </div>
    </body>
</html>