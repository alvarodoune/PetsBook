<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Inicio de sesion</title>
        <link rel="stylesheet" type="text/css" href="./css/ventas.css">
    </head>
    <body>
        
        {include file="encabezado.tpl"}
        
        <div id="divContenidoCompleto">
            <form method="POST" action="doLogin.php">
                <p>
                    Usuario <input type="text" name="usuario">
                </p>
                <p>
                    Clave <input type="password" name="clave">
                </p>
                {if (isset($err))}
                    Usuario/Clave invalidos
                {/if}
                <p>
                    <input type="checkbox" name="recordar"
                           value="si">Recordarme
                </p>
                <p>
                    <input type="submit" value="Iniciar">
                </p>
            </form>
        </div>
    </body>
</html>
