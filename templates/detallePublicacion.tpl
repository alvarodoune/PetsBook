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
        <script src="./js/detallePublicacion.js"></script>
        <link href="./libs/open-iconic-master/font/css/open-iconic-bootstrap.css" rel="stylesheet">
        <style>
            #map {
                height: 400px;
                width: 100%;
            }
        </style>
    </head>

    <body>
        {if $publicacion.abierto == "0" || $publicacion.abierto == NULL}
            <div class="alert alert-danger" role="alert">
                Publicación Cerrada!
            </div>
        {/if}
        {if $publicacion.exitoso == "1"}
            <div class="alert alert-success" role="alert">
                Otro caso de éxito donde se ha reencontrado con sus dueños!
            </div>
        {/if}

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="header">
                        {include file="./encabezado.tpl"}
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12" style="text-align: center; padding: 10px">
                    {if (isset($usuario) && $usuario.id === $publicacion.usuario_id && $publicacion.abierto == "1")}
                        <button type="button"
                                class="btn btn-danger"
                                data-toggle="modal"
                                data-target="#closeModal" 
                                data-usuario="{$usuario.id}"
                                data-id="{$publicacion.id}">Cerrar publicacion</button>
                    {/if}
                </div>
            </div>
            <div class="row">
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
                                    {foreach from=$imagenes item=img}
                                    <li data-target="#carouselExampleIndicators" data-slide-to="$img.id"></li>
                                    {/foreach}
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
                            <small>Raza: {$publicacion.raza}</small>
                            <small>Especie: {$publicacion.especie}</small>
                            <br>
                            <p class="mb-1">
                                {$publicacion.descripcion}
                            </p>
                            <small>Fecha de publicación: {$publicacion.fechaPublicado}</small>
                            <br>
                            {if $publicacion.latitud != 0 && $publicacion.longitud != 0}
                                <h3>Ubícalo en el mapa</h3>
                                <div id="map"></div>
                                <div id="lat" class="noVisible">{$publicacion.latitud}</div>
                                <div id="lon" class="noVisible">{$publicacion.longitud}</div>
                                <script async defer
                                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD01D0EbO2sskocLLV5Q0_s5c_FiR4qA1k&callback=initMap">
                                </script>
                            {/if}
                        </div>
                        <br>
                        <a type="button" class="btn btn-outline-secondary" href="imprimir.php?id={$publicacion.id}" target="_blank">Imprimir</a>
                        <!--<button type="button" class="btn btn-outline-secondary" id="print">Imprimir</button>-->
                    </div>

                    {if $publicacion.abierto == "1"}
                        <div class="list-group preguntar">
                            {if (isset($usuario))}
                                <button type="button"
                                        class="btn btn-success"
                                        data-toggle="modal"
                                        data-target="#questionModal" 
                                        data-usuario="{$usuario.id}"
                                        data-id="{$publicacion.id}">Nueva Pregunta</button>
                            {else}
                                <a href="login.php">Inicie sesión para preguntar</a>
                            {/if}
                            <div class="preguntas list-group">
                                {foreach from=$preguntas item=preg}
                                    <div class="card col-12">
                                        <div class="card-body">                            
                                            <h5 class="card-title">{$preg.usuario}</h5>
                                            <h6 class="card-subtitle mb-2 text-muted"></h6>
                                            <div class="alert alert-primary text-left" role="alert">
                                                <p class="card-text">{$preg.texto}</p>
                                            </div>
                                            {if $preg.respuesta != ""}
                                                <div class="alert alert-dark text-right" role="alert">
                                                    <p class="card-text">{$preg.respuesta}</p>
                                                </div>
                                            {else}
                                                {if (isset($usuario) && $usuario.id == $publicacion.usuario_id)}
                                                    <button type="button" 
                                                            class="btn btn-primary" 
                                                            data-toggle="modal"
                                                            data-preg="{$preg.texto}"
                                                            data-target="#answerModal" 
                                                            data-id="{$preg.id}"
                                                            >Responder</button>
                                                {/if}
                                            {/if}
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {/if}
                </div>

                <div class="modal fade" id="answerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Respuesta</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form name="respuesta" 
                                  id="respuesta" 
                                  action="procesarRespuesta.php" 
                                  method="POST">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">Respuesta:</label>
                                        <textarea name="respuesta" class="form-control" id="message-text"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-primary">Aceptar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="questionModal" 
                     tabindex="-1" 
                     role="dialog" 
                     aria-labelledby="questionModalLabel" 
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="questionModalTitle">Pregunta</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form name="pregunta" 
                                  id="pregunta" 
                                  action="hacerPregunta.php" 
                                  method="POST">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">Pregunta:</label>
                                        <textarea name="pregunta" class="form-control" id="message-text2"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-primary">Aceptar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>    

                <div class="modal fade" id="closeModal" 
                     tabindex="-1" 
                     role="dialog" 
                     aria-labelledby="closeModalLabel" 
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="questionModalTitle">Cerrar</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form name="cerrar" 
                                  id="cerrar" 
                                  action="cerrarPublicacion.php" 
                                  method="POST">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">Antes de cerrar la publicación por favor indique si lo encontro:</label>
                                        <div class="form-check">
                                            <input class="form-check-input" 
                                                   type="radio" 
                                                   name="exitoso" 
                                                   id="optionSi" 
                                                   value="1" checked>
                                            <label class="form-check-label" for="optionSi">
                                                Si, gracias!
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" 
                                                   type="radio" 
                                                   name="exitoso" 
                                                   id="optionNo" 
                                                   value="0">
                                            <label class="form-check-label" for="optionNo">
                                                No, lamentablemente.
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-primary">Aceptar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
            </div>

            {*           <div id="answerSuccessAlert" class="alert alert-success" data-dismiss="alert" role="alert">
            Su respuesta se ha guardado con éxito!
            </div>

            <script>
            $("#answerSuccessAlert").hide();
            </script>*}
        </div>
    </body>
</html>