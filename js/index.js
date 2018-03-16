$(document).ready(inicializar);

function inicializar() {
    var idPregunta;

    $('#btnFiltrar').click(aplicarFiltro);
//    $(".responderPregunta").click(function ($event) {
//        var id = $(this).data('id');
//        alert("Handler for .click() called.");
//    });

    $('#answerModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        idPregunta = button.data('id'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        modal.find('.modal-title').text('Respuesta a ' + idPregunta);
        //modal.find('.modal-body input').val(recipient);
    });

    // process the form
    $('form').submit(function (event) {
        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
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
                        console.error(data.errors[0]);
                    }
                });

        // stop the form from submitting the normal way and refreshing the page
        event.preventDefault();
    });
}

function aplicarFiltro() {
    $.ajax({
        url: 'filtros.php',
        type: 'POST',
        dataType: 'json',
        data: {filtro: $('#txtFiltro').val(),
            tipo: $('#cmbTipoDePublicacion').val(),
            especie: $('#cmbEspecie').val(),
            raza: $('#cmbRaza').val(),
            barrio: $('#cmbBarrio').val()},
        success: publicacionesRefresh
    });
}

function publicacionesRefresh(datos) {
    $('#publicaciones').empty();
    publicaciones = datos['publicaciones'];
    for (var i = 0; i < publicaciones.length; i++) {
        publicacion = publicaciones[i];
        fila = '<a href="./detallePublicacion.php?id=' + publicacion['id'] + ' target="_blank" publicacion=' + publicacion['id'];
        fila += ' class="list-group-item list-group-item-action flex-column align-items-start">';
        fila += ' <h5 class="mb-1">' + publicacion['titulo'] + '</h5>';
        fila += ' <div class="d-flex w-100 justify-content-between">';
        fila += '     <img src="imagenes/publicaciones/' + publicacion['imagen'] + '"';
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
        fila += ' <small>Fecha de publicación: {$pub.fechaPublicado}</small>';
        fila += ' </a>';

        $('#publicaciones').append(fila);
    }
}
