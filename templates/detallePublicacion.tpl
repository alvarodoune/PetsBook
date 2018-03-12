<!DOCTYPE html>
<html>

    <head>
        <title>PetsBook</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="./css/ventas.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
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
            <div class="row">
                {*<div class="col-3">
                <div id="divMenuLateral">
                {include file="./menuLateral.tpl"}
                </div>
                </div>*}

                <div class="col-12">
                    <div id="divCategorias">
                        {if $publicacion.tipo == "E"}
                            <h3 class="text-success">ENCONTRADO</h3>
                        {else}
                            <h3 class="text-danger">PERDIDO</h3>
                        {/if}

                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="imagenes/publicaciones/{$publicacion.image}" 
                                         class="d-block w-100"
                                         alt="{$publicacion.titulo}">
                                </div>

                                {foreach from=$imagenes item=img}
                                    <div class="carousel-item">
                                        <img src="imagenes/publicaciones/{$img.image}"
                                             class="d-block w-100"
                                             alt="{$publicacion.titulo}">
                                    </div>
                                {/foreach}
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>



                        <div class="list-group">
                            <h5 class="mb-1">{$publicacion.titulo}</h5>
                            <div class="d-flex w-100 justify-content-between">

                            </div>
                            <p class="mb-1">
                                {$publicacion.descripcion}
                            </p>
                            <small>Fecha de publicación: {$publicacion.fechaPublicado}</small>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>