<!-- Add fancyBox -->
<link rel="stylesheet" href="{php}echo base_url();{/php}template/fancyapps/source/jquery.fancybox.css" type="text/css" media="screen" />
<script type="text/javascript" src="{php}echo base_url();{/php}template/fancyapps/source/jquery.fancybox.pack.js"></script>
<style>
  #rmap-canvas {
    width: 100%;
    height: 500px;
  }
</style>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyBsrmrrBMxOsb47XSCMsr9jUNx2nZJca-A"></script>
<script>
  var marker;
  var markers = [];
  var rmap = '';
  var rinfoWindow = '';
  function rinitialize() {
    var rmapCanvas = document.getElementById('rmap-canvas');
    var mapOptions = {
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }     
    rmap = new google.maps.Map(rmapCanvas, mapOptions);
    rinfoWindow = new google.maps.InfoWindow;

    var rpt = new google.maps.LatLng(-4.094859, 104.077085);
    rmap.setCenter(rpt);
    rmap.setZoom(9);
  }
  
  function bindInfoWindow(marker, map, infoWindow, html) {
      google.maps.event.addListener(marker, 'click', function() {
        infoWindow.setContent(html);
        infoWindow.open(map, marker);
      });
    }

  function addMarker(lat, lng, info) {
    var pt = new google.maps.LatLng(lat, lng);
    //bounds.extend(pt);
    
    var infowindow = new google.maps.InfoWindow({
      content: info
    });
    marker = new google.maps.Marker({
        map: rmap,
        position: pt
    });
    marker.addListener('click', function() {
      infowindow.open(rmap, marker);
    });

    //bindInfoWindow(marker, rmap, rinfoWindow, info);
    markers.push(marker);
  }
  
  // Sets the map on all markers in the array.
      function setMapOnAll(rmap) {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(rmap);
        }
      }

      // Removes the markers from the map, but keeps them in the array.
      function clearMarkers() {
        setMapOnAll(null);
      }

      // Shows any markers currently in the array.
      function showMarkers() {
        setMapOnAll(rmap);
      }

      // Deletes all markers in the array by removing references to them.
      function deleteMarkers() {
        clearMarkers();
        markers = [];
      }
  
    google.maps.event.addDomListener(window, 'load', rinitialize);
</script>
<!-- START ROW -->
<div class="row">
	<div class="starter-template col-sm-2 col-md-2 col-lg-2">
		<div class="list-group">
          <a href="{php}echo base_url();{/php}log" class="list-group-item active">Alarm</a>
          <a href="{php}echo base_url();{/php}log/data_pelapor" class="list-group-item">Data Pelapor</a>
          <a href="{php}echo base_url();{/php}log/chat_laporan" class="list-group-item">Chat Laporan</a>
          <a href="{php}echo base_url();{/php}log/alarm_log" class="list-group-item">Alarm Log</a>
        </div>
	</div>
    <div class="starter-template col-sm-10 col-md-10 col-lg-10">
        <div class="panel panel-default">
          <div class="panel-heading">Live Alarm !!! <button id="toggle_alarm" class="blink">Pause Alarm</button></div>
          <div class="panel-body">
            <table class="table">
                <thead>
                    <tr>
                        <th>Jenis Laporan</th>
                        <th>Nama Pelapor</th>
                        <th>Hp</th>
                        <th>Lokasi</th>
                        <th>Koordinat (Lat/Lon)</th>
                        <th>Tanggal Lapor</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody id="alarm_data">
                </tbody>
            </table>
          </div>
        </div>
        
        <div class="panel panel-default">
          <div class="panel-heading">Map Koordinat Pelapor</div>
          <div class="panel-body">
            <div id="rmap-canvas">Map</div>
          </div>
        </div>
    </div>
</div>
<!-- end widget grid -->
<script>
    function getContent(timestamp) {
        var queryString = {literal}{'timestamp' : timestamp}{/literal};
        $.ajax(
            {
                type: 'GET',
                url: '{php}echo base_url();{/php}server.php',
                data: queryString,
                success: function(data){
                    // put result data into "obj"
                    var obj = jQuery.parseJSON(data);
                    // put the data_from_file into #response
                    //$('#response').html(obj.data_from_file);
                    alarm_ajax();
                    // call the function again, this time with the timestamp we just got from server.php
                    getContent(obj.timestamp);
                }, error: function() {
                    getContent();
                }
            }
        );
    }

    function alarm_ajax() {
        $("#alarm_data").html('<tr><td><img src="{php}echo base_url();{/php}template/assets/img/loading.gif"/></td></tr>');
        $.ajax({
          method: "POST",
          dataType: "json",
          url: "{php}echo base_url();{/php}log/alarm_list",
          data: ""
        }).done(function( msg) {
            clearMarkers();
            //setel alarm
            if (msg.bunyi == 1) {
                myAudio.addEventListener('ended', function() {
                    this.currentTime = 0;
                    this.play();
                }, false);
                myAudio.play();
                
                //add marker
                for (var key in msg.latlon) {
                    if (msg.latlon.hasOwnProperty(key)) {
                      addMarker(msg.latlon[key].lat, msg.latlon[key].lon,msg.latlon[key].info);
                    }
                }
                showMarkers();
            } else {
                $('.blink').css("display","none");
                myAudio.pause();
            }
            
            $("#alarm_data").html(msg.html);
            setfancy();
        }).error(function( msg ) {
            $("#alarm_data").html("Server Error, refresh again or contact administrator");
        })
        ;
    }
    
    function setfancy() {
		$(".fancybox").fancybox({
            arrows : false,
            'frameWidth': 500, 
            'frameHeight': 500,
            /* 'afterLoad': function(){
                google.maps.event.trigger(map, "resize");
            } */
        });
	}
    
    setInterval(function(){
      $('.blink').each(function(){
        $(this).css('visibility' , $(this).css('visibility') === 'hidden' ? '' : 'hidden')
      });
    }, 500);
    
    (function($) {
        $.fn.clickToggle = function(func1, func2) {
            var funcs = [func1, func2];
            this.data('toggleclicked', 0);
            this.click(function() {
                var data = $(this).data();
                var tc = data.toggleclicked;
                $.proxy(funcs[tc], this)();
                data.toggleclicked = (tc + 1) % 2;
            });
            return this;
        };
    }(jQuery));
    $(document).ready(function() {
        $('#toggle_alarm').clickToggle(function() {
            myAudio.pause();
        },
        function() {
            myAudio.play();
        });
        getContent();
    });
</script>