<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Iniciar sessión</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="./css/ventas.css">
        <script src="./js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="./libs/open-iconic-master/font/css/open-iconic-bootstrap.css" rel="stylesheet">
    </head>
    <body>

        {include file="encabezado.tpl"}

        <div id="divContenidoCompleto" class="col-9" style="margin:10px auto">
            <form method="POST" action="doLogin.php">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="usuario">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="form-check-label col-sm-2 col-form-label">Clave</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="password" name="clave">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="form-check-label col-sm-2 col-form-label"></label>
                    <div class="col-sm-10">
                        <input class="form-check-input" type="checkbox" name="recordar" value="si" id="defaultCheck1">
                        <label class="form-check-label" for="defaultCheck1">
                            Recordarme
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <button class="btn btn-outline-success col-12" type="submit">Iniciar</button>
                </div>
            </form>
            {if (isset($err))}
                <div id="registerSuccessAlert" 
                     class="alert alert-danger"
                     role="alert">
                    Usuario/clave inválidos!
                </div>
            {/if}
        </div>
    </body>
</html>
