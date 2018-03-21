/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(inicializar);

var lat;
var lon;

function inicializar() {
    $('#print').click(function () {
        $.ajax({
            url: 'imprimir.php',
            type: 'POST',
            dataType: 'json',
            data: {}
        });
    });
}

function initMap() {
    lat = $('#lat').html();
    lon = $('#lon').html();

    if (lat && lon) {
        setTimeout(loadMap, 500);
    }
}

function loadMap() {
    //var uluru = {lat: -34.8494129, lng: -55.9971745};
    var uluru = {lat: +lat, lng: +lon};
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 14,
        center: uluru
    });
    var marker = new google.maps.Marker({
        position: uluru,
        map: map
    });
}