$(document).ready(inicializar);

function inicializar() {
    var idPregunta;
    var idPublicacion;
    var usuario;

    $('#btnFiltrar').click(function () {
        aplicarFiltro();
    });
//    $(".responderPregunta").click(function ($event) {
//        var id = $(this).data('id');
//        alert("Handler for .click() called.");
//    });

    $('#answerModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        idPregunta = button.data('id'); // Extract info from data-* attributes
        var texto = button.data('preg');
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        modal.find('.modal-title').text(texto);
        //modal.find('.modal-body input').val(recipient);
    });

    $('#questionModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        idPublicacion = button.data('id');
        usuario = button.data('usuario');
        var modal = $(this);
        modal.find('.questionModalTitle').text("Escribe la pregunta que quieras hacer");
    });

    $('#closeModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        idPublicacion = button.data('id');
        usuario = button.data('usuario');
        var modal = $(this);
        //modal.find('.questionModalTitle').text("Escribe la pregunta que quieras hacer");
    });
    //exitoso

    // process the form
    $('form').submit(function (event) {
        switch (event.target.id) {
            case "respuesta":
                var formData = {
                    'id': idPregunta,
                    'respuesta': $('textarea[name=respuesta]').val()
                };

                // process the form
                $.ajax({
                    type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
                    url: 'procesarRespuesta.php', // the url where we want to POST
                    data: formData, // our data object
                    dataType: 'json', // what type of data do we expect back from the server
                    encode: true
                })
                        // using the done promise callback
                        .done(function (data) {

                            // log data to the console so we can see
                            if (data.success) {
                                $('#answerModal').modal('hide');
                                //$('#superhero-group').append('<div class="help-block">' + data.errors.superheroAlias + '</div>');
                                location.reload();
                                console.log(data);
                            } else {
                                console.error(data.errors);
                            }
                        });
                break;
            case "pregunta":

                var formData = {
                    'id': idPublicacion,
                    'usuario': usuario,
                    'pregunta': $('textarea[name=pregunta]').val()
                };

                $.ajax({
                    type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
                    url: 'hacerPregunta.php', // the url where we want to POST
                    data: formData, // our data object
                    dataType: 'json', // what type of data do we expect back from the server
                    encode: true
                })
                        .done(function (data) {
                            if (data.success) {
                                $('#questionModal').modal('hide');
                                location.reload();
                                console.log(data);
                            } else {
                                console.error(data.errors);
                            }
                        });
                break;
            case "register":
                $('#registerSuccessAlert').hide();
                $('#registerErrorAlert').hide();
                var formData = {
                    'email': $('input[name=email]').val(),
                    'name': $('input[name=name]').val(),
                    'pass': $('input[name=pass]').val()
                };

                if (formData.pass.length < 8) {
                    alert("El password debe tener al menos 8 caracteres");
                } else {
                    $.ajax({
                        type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
                        url: 'doRegister.php', // the url where we want to POST
                        data: formData, // our data object
                        dataType: 'json', // what type of data do we expect back from the server
                        encode: true
                    })
                            .done(function (data) {
                                if (data.success) {
                                    $('#registerSuccessAlert').show();
                                    console.log(data);
                                } else {
                                    $('#registerErrorAlert').append(data.errors);
                                    $('#registerErrorAlert').show();
                                    console.error(data.errors);
                                }
                            });
                }
                break;
            case "cerrar":
                var formData = {
                    'idPub': idPublicacion,
                    'usuario': usuario,
                    'exitoso': $('input[name=exitoso]:checked').val()
                };
                
                $.ajax({
                    type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
                    url: 'doClose.php', // the url where we want to POST
                    data: formData, // our data object
                    dataType: 'json', // what type of data do we expect back from the server
                    encode: true
                })
                        .done(function (data) {
                            if (data.success) {
                                $('#closeModal').modal('hide');
                                location.reload();
                                console.log(data);
                            } else {
                                
                                console.error(data.errors);
                            }
                        });
                break;
        }
        // stop the form from submitting the normal way and refreshing the page
        event.preventDefault();
    });

    $('#cmbFilas').change(function () {
        aplicarFiltro();
    });

    cargarPublicaciones();

    $('#paginado').on('click', '.page-item', function (e) {
        aplicarFiltro($(this).attr('attr'));
    });
}

function cargarPublicaciones() {
    aplicarFiltro();
}

function aplicarFiltro(pagNro) {
    $.ajax({
        url: 'filtros.php',
        type: 'POST',
        dataType: 'json',
        data: {filtro: $('#txtFiltro').val(),
            tipo: $('#cmbTipoDePublicacion').val(),
            especie: $('#cmbEspecie').val(),
            raza: $('#cmbRaza').val(),
            barrio: $('#cmbBarrio').val(),
            cantxpag: $('#cmbFilas').val(),
            pagina: pagNro},
        success: publicacionesRefresh
    });
}

function publicacionesRefresh(datos) {
    $('#paginado').empty();
    $('#publicaciones').empty();
    paginas = datos['paginas'];
    publicaciones = datos['publicaciones'];
    for (var i = 0; i < publicaciones.length; i++) {
        publicacion = publicaciones[i];
        fila = '<a href="./detallePublicacion.php?id=' + publicacion['id'] + '" target="_blank" publicacion=' + publicacion['id'];
        fila += ' class="list-group-item list-group-item-action flex-column align-items-start">';
        fila += ' <h5 class="mb-1">' + publicacion['titulo'] + '</h5>';
        fila += ' <div class="d-flex w-100 justify-content-between">';
        fila += '     <img src="imagenes/publicaciones/' + publicacion['image'] + '"';
        fila += '          class="rounded float-left aspect-ratio"';
        fila += '          alt="' + publicacion['titulo'] + '">';
        fila += '     <small>';
        if (publicacion['tipo'] === 'E') {
            fila += '   <span class="oi oi-arrow-thick-left text-success"';
            fila += '       title="Encontrado" aria-hidden="true"></span>';
        } else {
            fila += '   <span class="oi oi-arrow-thick-right text-danger"';
            fila += '       title="Perdido" aria-hidden="true"></span>';
        }
        fila += '</small>';
        fila += ' </div>';
        fila += ' <p class="mb-1">';
        fila += publicacion['descripcion'];
        fila += ' </p>';
        fila += ' <small>Fecha de publicación: ' + publicacion['fechaPublicado'] + '</small>';
        fila += ' </a>';

        $('#publicaciones').append(fila);
    }
    //Paginado
    for (var i = 0; i < paginas; i++) {
        pagina = i + 1;
        fila = '<li class="page-item" attr="' + pagina + '"><a class="page-link" href="#">' + pagina + '</a></li>';
        $('#paginado').append(fila);
    }
}
