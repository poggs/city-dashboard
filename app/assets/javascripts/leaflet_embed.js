var map;
var ajaxRequest;
var plotlist;
var plotlayers=[];

function initmap() {
  map = new L.Map('map');
  var osmUrl='http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
  var osmAttrib='Map data © <a href="http://openstreetmap.org">OpenStreetMap</a> contributors';
  var osm = new L.TileLayer(osmUrl, {minZoom: 8, maxZoom: 12, attribution: osmAttrib});		
  map.setView(new L.LatLng(51.3, 0.7),9);
  map.addLayer(osm);
}

function addMarkerForPostcode(postcode) {
  $.getJSON('/geocode/' + postcode, function(data) {
    marker = new L.Marker([data[2], data[1]]);
    marker.addTo(map);
  })
}
