var pagina = 1;
var categoria = 1;

function cargarCategoria(id) {
    
    categoria = id;
    
    $.ajax({
        url: 'contenido.php',
        dataType: 'html',
        data: {cat: id, pag: pagina }
    }).done(function (html) {
        $('#divContenido').html(html);

        $("#anterior").click(function () {
            pagina = pagina - 1;
            cargarCategoria(categoria, pagina);
        });

        $("#siguiente").click(function () {
            pagina = pagina + 1;
            cargarCategoria(categoria, pagina);
        });
        
        $("#primero").click(function () {
            pagina = 1;
            cargarCategoria(categoria, pagina);
        });
        
         $("#ultimo").click(function () {
            pagina = $("#total").val();
            cargarCategoria(categoria, pagina);
        });

    }).fail(function () {
        alert('no se pudo cargar el contenido');
    });
}

$(document).ready(function () {
    cargarCategoria(1);

    $(".link-categoria").click(function () {
        var id = $(this).attr('categoria');
        cargarCategoria(id);
    });


});


