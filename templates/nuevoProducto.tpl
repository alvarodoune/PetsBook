<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Nuevo Producto</title>
        <link rel="stylesheet" type="text/css" href="./css/ventas.css">
    </head>
    <body>
        
        {include file="encabezado.tpl"}
      
        <div id="divContenidoCompleto">
            <form method="POST" action="./guardarProducto.php"
                  enctype="multipart/form-data">
                <p> Nombre
                    <input type="text" name="nombre">
                </p>
                 <p> Descripcion <br>
                     <textarea rows="5" cols="50" name="descripcion"></textarea>
                </p>
                <p> Categoria
                    <select name="catId">
                    {foreach from=$categorias item=cat}
                         <option value="{$cat.id}">{$cat.nombre}</option>
                    {/foreach}
                    </select>
                </p>
                <p> Imagen
                    <input type="file" name="imagen"  accept="image/*" />
                </p>
                <p>
                    <input type="submit" value="Guardar">
                </p>
            </form>
        </div>
    </body>
</html>