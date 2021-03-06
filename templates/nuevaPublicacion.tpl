<!DOCTYPE html>
<html>
    <head>
        <title>Nueva Publicación</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="./css/ventas.css">
        <script src="./js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="./js/nuevaPublicacion.js"></script>
        <link href="./libs/open-iconic-master/font/css/open-iconic-bootstrap.css" rel="stylesheet">

        <style>
            #map {
                height: 400px;
                width: 100%;
            }
        </style>
    </head>
    <body>

        {include file="encabezado.tpl"}

        <div id="nuevaPublicacion" class="col-9">
            <form method="POST" action="guardarPublicacion.php" enctype="multipart/form-data">
                <input id="lat" type="hidden" name="lat" value="">
                <input id="lon" type="hidden" name="lon" value="">
                <label>Tipo de publicación</label>
                <div class="form-check">
                    <input class="form-check-input" 
                           type="radio" 
                           name="tipo" 
                           id="tipoPerdida" value="P" checked>
                    <label class="form-check-label" for="tipoPerdida">
                        Perdida
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" 
                           type="radio" 
                           name="tipo" 
                           id="tipoEncontrada" 
                           value="E">
                    <label class="form-check-label" for="tipoEncontrada">
                        Encontrada
                    </label>
                </div>
                <br>
                <div class="form-group">
                    <label class="form-check-label" for="cboEspecie">
                        Especie
                    </label>
                    <select name="especie" class="custom-select mr-sm-2" 
                            id="cboEspecie" required>
                        <option value="">Seleccione una especie</option>
                        {foreach from=$especies item=e}
                            <option value={$e.id}>{$e.nombre}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-check-label" for="cboRaza">
                        Raza
                    </label>
                    <select name="raza" class="custom-select mr-sm-2" 
                            id="cboRaza" required>
                        {foreach from=$razas item=r}
                            <option value={$r.id}>{$r.nombre}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-check-label" for="cboBarrio">
                        Barrio
                    </label>
                    <select name="barrio" class="custom-select mr-sm-2" 
                            id="cboBarrio" required>
                        {foreach from=$barrios item=b}
                            <option value={$b.id}>{$b.nombre}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label for="titulo">Título</label>
                    <input type="text"
                           name="titulo"
                           required
                           title="El titulo es requerido"
                           class="form-control" 
                           id="titulo" 
                           aria-describedby="titleHelp" placeholder="Ingrese el título">
                    <small id="titleHelp" class="form-text text-muted">Sea breve y conciso.</small>
                </div>
                <div class="form-group">
                    <label for="desc">Descripción</label>
                    <textarea
                        name="desc"
                        required
                        class="form-control" 
                        title="La descripcion es requerida"
                        id="desc" 
                        placeholder="Ingrese la descripción"></textarea>
                </div>
                <div class="form-group">
                    <label for="imagen">Foto principal</label>
                    <input type="file" 
                           name="imagen"
                           required 
                           class="form-control-file" 
                           id="imagen">
                    <small class="form-text text-muted">Esta imagen aparecerá de portada.</small>
                </div>
                <div class="form-group">
                    <label for="imagen">Mas fotos</label>
                    <input name="upload[]" 
                           type="file"
                           multiple="multiple"
                           class="form-control-file" 
                           id="upload">
                    <small class="form-text text-muted">Puede subir tantas fotos opcionales como desee.</small>
                </div>

                <h6>Opcionalmente puede seleccionar la ubicación haciendo click en el mapa</h6>
                <div id="map"></div>
                <script async defer
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD01D0EbO2sskocLLV5Q0_s5c_FiR4qA1k&callback=initMap">
                </script>
                <br>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary col-12">Crear</button>
                </div>
            </form>
        </div>
    </body>
</html>