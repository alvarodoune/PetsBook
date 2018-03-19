$(document).ready(inicializar);

function inicializar() {
    $('#cboRaza').prop('disabled', true); //disabled razas por defecto.

    $('#cboEspecie').change(function (event) {
        var especie = $(this).val();
        if (especie === "") {
            $('#cboRaza').prop('disabled', true);
            $('#cboRaza').empty();
        } else {
            $('#cboRaza').prop('disabled', false);
            reloadRazas(especie);
        }
    });

//    $('form').submit(function (event) {
//        event.preventDefault();
//        var file_data = $('#imagen').prop('files')[0];
//
//        var formData = {
////            'tipo': $('input[name=tipo]').val(),
////            'especie': $('#cboEspecie').val(),
////            'raza': $('#cboRaza').val(),
////            'barrio': $('#cboBarrio').val(),
////            'titulo': $('#titulo').val(),
////            'desc': $('#desc').val(),
//            'imagen': file_data
//        };
//
//        console.log(formData);
//
//        $.ajax({
//            url: 'guardarPublicacion.php',
//            type: 'POST',
//            dataType: 'text',
//            data: formData,
//            processData: false,
//            cache: false,
//            contentType: false,
//        }).done(function (data) {
//            console.log(data);
//        });
//    });
}

function reloadRazas(especie) {
    $.ajax({
        url: 'loadRazasByEspecie.php',
        type: 'POST',
        dataType: 'json',
        data: {
            especie: especie
        },
        success: razasRefresh
    });
}

function razasRefresh(datos) {
    $('#cboRaza').empty();

    datos.forEach(function (element) {
        $('#cboRaza').append("<option value='" + element.id + "'>" + element.nombre + '</option>');
    });
}
