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
        <script src="./js/index.js"></script>
        <link href="./libs/open-iconic-master/font/css/open-iconic-bootstrap.css" rel="stylesheet">
    </head>
    <body>

        {include file="encabezado.tpl"}

        <div id="nuevaPublicacion" class="col-9">
            <form method="POST" action="">
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
                    <label class="form-check-label" for="especie">
                        Especie
                    </label>
                    <select name="especie" class="custom-select mr-sm-2" id="especie">
                        <option selected>Choose...</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-check-label" for="raza">
                        Raza
                    </label>
                    <select name="raza" class="custom-select mr-sm-2" id="raza">
                        <option selected>Choose...</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-check-label" for="barrio">
                        Barrio
                    </label>
                    <select name="barrio" class="custom-select mr-sm-2" id="barrio">
                        <option selected>Choose...</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="email">Título</label>
                    <input type="email"
                           name="email"
                           class="form-control" 
                           id="email" aria-describedby="emailHelp" placeholder="Ingrese el título">
                    <small id="emailHelp" class="form-text text-muted">Sea breve y conciso.</small>
                </div>
                <div class="form-group">
                    <label for="password">Descripción</label>
                    <textarea
                        name="descripcion"
                        class="form-control" 
                        id="descripcion" 
                        placeholder="Ingrese la descripción"></textarea>
                </div>
                <div class="form-group">
                    <label for="password">Foto principal</label>
                    <input type="file" class="form-control-file" id="exampleFormControlFile1">
                    <small class="form-text text-muted">Luego podrá agregar todas las fotos necesarias.</small>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Crear</button>
                </div>
            </form>
        </div>
    </body>
</html>