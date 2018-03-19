$(document).ready(inicializar);

function inicializar() {
    $('#cboRaza').prop('disabled', true); //disabled razas por defecto.

    $('#cboEspecie').change(function (event) {
        var especie = $(this).val();
        if (especie === "0") {
            $('#cboRaza').prop('disabled', true);
            $('#cboRaza').empty();
        } else {
            $('#cboRaza').prop('disabled', false);
            reloadRazas(especie);
        }
    });
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
