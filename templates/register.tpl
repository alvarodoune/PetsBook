<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registrarse en el sitio</title>
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

        <div class="col-12">
            <form id="register" method="POST" action="doRegister.php">
                <div class="form-group">
                    <label class="form-check-label">Email</label>
                    <input type="email" name="email" title="El email es requerido" required>
                </div>
                <div class="form-group">
                    <label class="form-check-label">Nombre</label>
                    <input type="text" name="name" title="El nombre es requerido" required>
                </div>
                <div class="form-group">
                    <label class="form-check-label">Clave</label>
                    <input type="password"
                           name="pass"
                           minlength="8"
                           required
                           pattern="^(?=.*[0-9])(?=.*[a-z])([a-z0-9_-]+)$" 
                           title="Debe tener 8 dígitos con al menos una letra y un número.">
                </div>
                <div class="form-group">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Registrarse</button>
                </div>

                {if (isset($err))}
                    Usuario/Clave invalidos
                {/if}
                <div id="registerSuccessAlert" 
                     class="alert alert-success"
                     role="alert">
                    Usuario registrado con éxito!
                </div>

                <div id="registerErrorAlert" 
                     class="alert alert-danger"
                     role="alert">
                </div>
            </form>
        </div>
        <script>
            $('#registerSuccessAlert').hide();
            $('#registerErrorAlert').hide();
        </script>
    </body>
</html>
