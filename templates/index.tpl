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
                <div class="col-3">
                    <div id="divMenuLateral">
                        {include file="./menuLateral.tpl"}
                    </div>
                </div>

                <div class="col-9">
                    <div id="divCategorias">
                        <h1>Publicaciones</h1>
                        <div class="list-group">
                            {foreach from=$publicaciones item=pub}
                                <a href="#" 
                                   publicacion="{$pub.id}"
                                   class="list-group-item list-group-item-action flex-column align-items-start"
                                   >
                                    <h5 class="mb-1">{$pub.titulo}</h5>
                                    <div class="d-flex w-100 justify-content-between">
                                        <img src="imagenes/publicaciones/{$pub.image}" 
                                             class="rounded float-left aspect-ratio"
                                             alt="{$pub.titulo}">    
                                        <small>
                                            {if $pub.tipo == "E"}
                                                <span class="oi oi-arrow-thick-left text-success"
                                                      title="Encontrado" aria-hidden="true"></span>
                                            {else}
                                                <span class="oi oi-arrow-thick-right text-danger"
                                                      title="Perdido" aria-hidden="true"></span>
                                            {/if}
                                        </small>
                                    </div>
                                    <p class="mb-1">
                                        {$pub.descripcion}
                                    </p>
                                    <small>Fecha de publicación: {$pub.fechaPublicado}</small>
                                </a>
                            {/foreach}
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>