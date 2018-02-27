<div id="divEncabezado">
    <h1>Mascotas Perdidas</h1>

     <a href="./index.php">Pagina de Inicio</a> |
    
    {if (isset($usuario))}
        Hola {$usuario.nombre} |
        <a href="./nuevaCategoria.php">Crear Categoria</a> |
        <a href="./nuevoProducto.php">Crear Producto</a> |
        <a href="./doLogout.php">Salir</a>
        
    {else}
        <a href="./login.php">Iniciar sesion</a>
    {/if}

</div>