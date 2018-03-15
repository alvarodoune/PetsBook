$(document).ready(inicializar);

function inicializar() {
    $('#btnFiltrar').click(aplicarFiltro);
    $(".responderPregunta").click(function ($event) {
        var id = $(this).data('id');
        alert("Handler for .click() called.");
    });
}

function aplicarFiltro() {
    $.ajax({
        url: 'filtros.php',
        type: 'POST',
        dataType: 'json',
        data: {filtro : $('#txtFiltro').val(), 
            tipo : $('#cmbTipoDePublicacion').val(),
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
