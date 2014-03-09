function loadStationUsageData() {

  var stationStyle = L.AwesomeMarkers.icon({
    prefix: 'fa',
    icon: 'info',
    markerColour: 'blue'
  })

  $.getJSON('/station_usage.json', function(data) {
    for(var i=0; i<data.length; i++) {
      e = data[i]
      title = e[1];
      marker = new L.Marker([e[2], e[3]], { icon: stationStyle });

      var markerText = '';
      markerText = markerText + '<li>2012/13 usage: <em>' + e[13] + '</em></li>'
      markerText = markerText + '<li>2011/12 usage: <em>' + e[14] + '</em></li>'

      marker.bindPopup('<strong>' + title + '</strong><ul>' + markerText + '</ul>');
      marker.addTo(map);
    }
  })

}

function loadWaterAlertData() {

  $.getJSON('/yw_incidents', function(data) {
    for(var i=0; i<data.length; i++) {
      e = data[i];
      var marker = new L.Marker([ e.Latitude, e.Longitude ]);
      marker.addTo(map);
    }
  })

}

function loadWaterCurrentInvestments() {

  var markerStyle = L.AwesomeMarkers.icon({
    icon: 'thumbs-up',
    markerColour: 'green'
  })

  $.getJSON('/yw_investments', function(data) {
    for(var i=0; i<data.length; i++) {
      e = data[i];
      var marker = new L.Marker([ e.Latitude, e.Longitude ], { icon: markerStyle });
      var markerText = '<strong>' + e['Name'] + '</strong><br /><em>' + e['Type'] + '</em>';
      markerText = markerText + '<p>' + e['Description'] + '</p>'
      marker.bindPopup(markerText);
      marker.addTo(map);
    }
  })

}

function loadOverlayMap() {

  var url='/maps/tile/{z}/{x}/{y}.png';
  var attrib = 'Contains Ordnance Survey data &copy; Crown Copyright and database right 2011 and map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>';
  var new_layer = new L.TileLayer(url, { tms: true, attribution: attrib});

  new_layer.addTo(map);

}