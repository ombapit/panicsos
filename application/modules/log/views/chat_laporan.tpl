<!-- Add fancyBox -->
<link rel="stylesheet" href="{php}echo base_url();{/php}template/fancyapps/source/jquery.fancybox.css" type="text/css" media="screen" />
<script type="text/javascript" src="{php}echo base_url();{/php}template/fancyapps/source/jquery.fancybox.pack.js"></script>

    <!-- row -->
	<div class="row">
        <div class="starter-template col-sm-2 col-md-2 col-lg-2">
            <div class="list-group">
              <a href="{php}echo base_url();{/php}log" class="list-group-item">Alarm</a>
              <a href="{php}echo base_url();{/php}log/data_pelapor" class="list-group-item">Data Pelapor</a>
              <a href="{php}echo base_url();{/php}log/chat_laporan" class="list-group-item active">Chat Laporan</a>
              <a href="{php}echo base_url();{/php}log/alarm_log" class="list-group-item">Alarm Log</a>
            </div>
        </div>
        <div class="starter-template col-sm-10 col-md-10 col-lg-10">
            <div class="panel panel-default">
              <div class="panel-heading">Chat Laporan</div>
              <div class="panel-body">
                 <!-- NEW WIDGET START -->
                    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <!-- Widget ID (each widget will need unique ID)-->
                        <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-1" data-widget-editbutton="false">
                            <!-- widget options:
                            usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

                            data-widget-colorbutton="false"
                            data-widget-editbutton="false"
                            data-widget-togglebutton="false"
                            data-widget-deletebutton="false"
                            data-widget-fullscreenbutton="false"
                            data-widget-custombutton="false"
                            data-widget-collapsed="true"
                            data-widget-sortable="false"

                            -->
                            <!-- widget div-->
                            <div>

                                <!-- widget edit box -->
                                <div class="jarviswidget-editbox">
                                    <!-- This area used as dropdown edit box -->

                                </div>
                                <!-- end widget edit box -->

                                <!-- widget content -->
                                <div class="widget-body no-padding">
                                    <table id="datatable_fixed_column" class="table table-striped table-bordered smart-form">
                                        <thead>
                                            <tr>
                                                <th>Gambar</th>
                                                <th>Pesan</th>
                                                <th>Nama</th>
                                                <th>Identitas (KTP/SIM)</th>
                                                <th>Alamat</th>
                                                <th>Hp</th>
                                                <th>Tanggal dibuat</th>
                                            </tr>
                                            <tr class="second">
                                                <td>
                                                    <label class="input">
                                                        <input type="text" name="gambar" value="Filter Gambar" class="search_init" style="display: none">
                                                    </label>
                                                </td>
                                                <td>
                                                    <label class="input">
                                                        <input type="text" name="pesan" value="Filter Pesan" class="search_init">
                                                    </label>
                                                </td>
                                                <td>
                                                    <label class="input">
                                                        <input type="text" name="nama" value="Filter Nama" class="search_init">
                                                    </label>
                                                </td>
                                                <td>
                                                    <label class="input">
                                                        <input type="text" name="ktpsim" value="Filter Identitas" class="search_init">
                                                    </label>
                                                </td>
                                                <td>
                                                    <label class="input">
                                                        <input type="text" name="alamat" value="Filter Alamat" class="search_init">
                                                    </label>	
                                                </td>
                                                <td>
                                                    <label class="input">
                                                        <input type="text" name="hp" value="Filter HP" class="search_init">
                                                    </label>	
                                                </td>
                                                <td>
                                                    <label class="input">
                                                        <input type="text" name="created_date" value="Filter Tanggal dibuat" class="search_init">
                                                    </label>	
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end widget content -->

                            </div>
                            <!-- end widget div -->

                        </div>
                        <!-- end widget -->
                    </article>
                    <!-- WIDGET END -->
              </div>
            </div>
        </div>
<script src="{php}echo base_url();{/php}template/js/plugin/datatables/jquery.dataTables-cust.min.js"></script>
<script src="{php}echo base_url();{/php}template/js/plugin/datatables/DT_bootstrap.js"></script>
<script type="text/javascript">
	function runDataTables() {
		/* Add the events etc before DataTables hides a column */
		$("#datatable_fixed_column thead input").keyup(function() {
			oTable.fnFilter(this.value, oTable.oApi._fnVisibleToColumnIndex(oTable.fnSettings(), $("thead input").index(this)));
		});

		$("#datatable_fixed_column thead input").each(function(i) {
			this.initVal = this.value;
		});
		$("#datatable_fixed_column thead input").focus(function() {
			if (this.className == "search_init") {
				this.className = "";
				this.value = "";
			}
		});
		$("#datatable_fixed_column thead input").blur(function(i) {
			if (this.value == "") {
				//this.className = "search_init";
				this.value = this.initVal;
			}
		});
		
		var oTable = $('#datatable_fixed_column').dataTable({
            "bProcessing": true,
            "bServerSide": true,
            "sAjaxSource": base_url + 'log/chat_laporan/table_list',
			"sPaginationType": "bootstrap",
            "iDisplayStart ": 20,
            "oLanguage": {
                "sProcessing": "<img src='" + base_url + "template/assets/img/ajax-loader.gif'>"
            },
            "fnInitComplete": function () {
                oTable.fnAdjustColumnSizing();
                setfancy();
            },
            'fnServerData': function (sSource, aoData, fnCallback) {
                $.ajax
                ({
                    'dataType': 'json',
                    'type': 'POST',
                    'url': sSource,
                    'data': aoData,
                    'success': fnCallback
                });
            },
			"bSortCellsTop" : true,
			"sScrollX": "100%",
			"sScrollY": 350,
			"bScrollCollapse": true
        });
		$("#datatable_fixed_column_filter").css("display","none");
	}
	runDataTables();
	
    function setfancy() {
		$(".fancybox").fancybox();
	}
</script>