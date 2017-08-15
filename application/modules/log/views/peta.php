<!DOCTYPE html>
<html>
  <head>
    <style>
      #map-canvas {
        width: 100%;
        height: 500px;
      }
    </style>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyBsrmrrBMxOsb47XSCMsr9jUNx2nZJca-A"></script>
    <script>
    var marker;
      function initialize() {
        var mapCanvas = document.getElementById('map-canvas');
        var mapOptions = {
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }     
        var map = new google.maps.Map(mapCanvas, mapOptions);
        var infoWindow = new google.maps.InfoWindow;      
        var bounds = new google.maps.LatLngBounds();
 
 
        function bindInfoWindow(marker, map, infoWindow, html) {
          google.maps.event.addListener(marker, 'click', function() {
            infoWindow.setContent(html);
            infoWindow.open(map, marker);
          });
        }
 
          function addMarker(lat, lng, info) {
            var pt = new google.maps.LatLng(lat, lng);
            //bounds.extend(pt);
            var marker = new google.maps.Marker({
                map: map,
                position: pt
            });       
            //map.fitBounds(bounds);
            map.setCenter(pt);
            map.setZoom(15);
            bindInfoWindow(marker, map, infoWindow, info);
          }
 
          <?php echo ("addMarker({$detail['lat']}, {$detail['lon']}, '<b>Koordinat {$detail['nama']}<br/>Latlon: {$detail['lat']}, {$detail['lon']}</b>');\n"); ?>
        }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>
  <body>
    <div id="map-canvas"></div>
  </body>
</html>