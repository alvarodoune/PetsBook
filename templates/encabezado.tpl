<div id="divEncabezado">
    <!-- <a href="./index.php">Pagina de Inicio</a> | {if (isset($usuario))} Hola {$usuario.nombre} |
    <a href="./nuevaCategoria.php">Crear Categoria</a> |
    <a href="./nuevoProducto.php">Crear Producto</a> |
    <a href="./doLogout.php">Salir</a> {else}
    <a href="./login.php">Iniciar sesion</a> {/if} -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        {if (isset($usuario))}
            <span class="navbar-brand">Hola {$usuario.nombre}</span> 
        {/if}

        <button class="navbar-toggler" 
                type="button" 
                data-toggle="collapse" 
                data-target="#navbarSupportedContent" 
                aria-controls="navbarSupportedContent" 
                aria-expanded="false" 
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="./index.php">Página de Inicio<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Filtrar
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Encontradas</a>
                        <a class="dropdown-item" href="#">Perdidas</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                {if (isset($usuario))}
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="./doLogout.php">Salir</a>
                    </li>
                {else}
                    <li class="nav-item">
                        <a class="nav-link" href="./login.php">Iniciar sesion</a>
                    </li>
                {/if}
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
</div>