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


}

function initMap() {
    var myLatlng = {lat: -34.921839612207584, lng: -56.16119127106231};

    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: myLatlng
    });

    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: 'Lugar del acontecimiento'
    });

    //Add listener
    map.addListener("click", function (event) {
        var latitude = event.latLng.lat();
        var longitude = event.latLng.lng();
        var pLatlng = {lat: latitude, lng: longitude};
        
        $('#lat').val(latitude);
        $('#lon').val(longitude);

        marker.setPosition(pLatlng);
    });

//    map.addListener('center_changed', function () {
//        // 3 seconds after the center of the map has changed, pan back to the
//        // marker.
//        window.setTimeout(function () {
//            map.panTo(marker.getPosition());
//        }, 3000);
//    });

//    marker.addListener('click', function () {
//        map.setZoom(8);
//        map.setCenter(marker.getPosition());
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
