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
        <script src="./js/index.js"></script>
        <link href="./libs/open-iconic-master/font/css/open-iconic-bootstrap.css" rel="stylesheet">
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="header">
                        {include file="./encabezado.tpl"}
                    </div>
                </div>
            </div>
            <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand" href="#">Filtros avanzados +</a>
                <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample01" aria-controls="navbarsExample01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse" id="navbarsExample01" style="">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <label for="cmbTipoDePublicacion">Tipo de publicación</label>
                            <select id="cmbTipoDePublicacion">
                                <option value="0"></option>
                                <option value="E">Encontrada</option>
                                <option value="P">Perdida</option>
                            </select>
                        </li>
                        <li class="nav-item">
                            <label for="cmbEspecie">Especie</label>
                            <select id="cmbEspecie">
                                <option value="0"></option>
                                {foreach from=$especies item=e}
                                    <option value={$e.id}>{$e.nombre}</option>
                                {/foreach}
                            </select>
                        </li>
                        <li class="nav-item">
                            <label for="cmbRaza">Raza</label>
                            <select id="cmbRaza">
                                <option value="0"></option>
                                {foreach from=$razas item=r}
                                    <option value={$r.id}>{$r.nombre}</option>
                                {/foreach}
                            </select>
                        </li>
                        <li class="nav-item">
                            <label for="cmbBarrio">Barrio</label>
                            <select id="cmbBarrio">
                                <option value="0"></option>
                                {foreach from=$barrios item=b}
                                    <option value={$b.id}>{$b.nombre}</option>
                                {/foreach}
                            </select>
                        </li>
                        <li class="nav-item">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="btnFiltrar">Actualizar</button>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="row">
                <!--<div class="col-3">
                    <div id="divMenuLateral">
                        {include file="./menuLateral.tpl"}
                    </div>
                </div>-->
                <div class="col-9">
                    <div id="divCategorias">
                        <h1>Publicaciones</h1>
                        <div class="list-group" id="publicaciones">
                        </div>
                        <select id="cmbFilas">
                            <option value="10">10</option>
                            <option value="20">20</option>
                            <option value="50">50</option>
                            <option value="0">Todas</option>
                        </select>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-end" id="paginado"></ul>
                        </nav>
                    </div>
                </div>
            </div>
    </body>
</html>