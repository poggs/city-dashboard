function loadStationUsageData() {

  $.getJSON('/station_usage.json', function(data) {
    for(var i=0; i<data.length; i++) {
      e = data[i]
      title = e[1];
      marker = new L.Marker([e[2], e[3]]);

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

  $.getJSON('/yw_investments', function(data) {
    for(var i=0; i<data.length; i++) {
      e = data[i];
      var marker = new L.Marker([ e.Latitude, e.Longitude ]);
      var markerText = '<strong>' + e['Name'] + '</strong><br /><em>' + e['Type'] + '</em>';
      markerText = markerText + '<p>' + e['Description'] + '</p>'
      marker.bindPopup(markerText);
      marker.addTo(map);
    }
  })

}