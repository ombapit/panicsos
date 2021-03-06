<!-- widget grid -->
<section id="widget-grid" class="">

	<!-- row -->
	<div class="row">

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
				<header>
					<h2>List Detail</h2>

				</header>
				
				{$alert_block}

				<!-- widget div-->
				<div>

					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->

					</div>
					<!-- end widget edit box -->

					<!-- widget content -->
					<div class="widget-body no-padding">
						<div class="widget-body-toolbar">
							<div class="row">
								<div class="col-xs-3 col-sm-2 col-md-2 col-lg-2 text-left">
									
								</div>
							</div>
						</div>
						<table id="datatable_fixed_column" class="table table-striped table-bordered smart-form">
							<thead>
								<tr>
									<th>Username</th>
									<th>Email</th>
									<th>User Type Expiration (Month)</th>
									<th style="width: 50px;">Actions</th>
								</tr>
								<tr class="second">
									<td>
										<label class="input">
											<input type="text" name="username" value="Filter Username" class="search_init">
										</label>
									</td>
									<td>
										<label class="input">
											<input type="text" name="email" value="Filter Email" class="search_init">
										</label>	
									</td>
									<td>
										<label class="input">
											<input type="text" name="user_type_expiration" value="Filter Expiration" class="search_init">
										</label>	
									</td>
									<td>
										&nbsp;
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

	<!-- end row -->

	<!-- end row -->

</section>
<!-- end widget grid -->

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
            "sAjaxSource": base_url + 'user_management/notification/table_list',
			"sPaginationType": "bootstrap",
            "iDisplayStart ": 20,
            "oLanguage": {
                "sProcessing": "<img src='" + base_url + "template/assets/img/ajax-loader.gif'>"
            },
            "fnInitComplete": function () {
                oTable.fnAdjustColumnSizing();
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
			"bScrollCollapse": true,
			"aoColumnDefs": [
            { "sWidth": "200px", "aTargets": [ 3 ] },
			]
        });
		$("#datatable_fixed_column_filter").css("display","none");
	}
	runDataTables();
	
	function confirm_ask(module,cond,id) {
		var r = confirm("Are you sure to "+ cond +" this request?");
		if (r == true) {
			process_data(module,id);
		}
		return false;
	}

	function process_data(module,id) {
		$.ajax({
			type : "POST",
			url : base_url + module + '/' + id,
			dataType : 'json',
			beforeSend : function() {
				// cog placed
				$("#block_msg").html('Processing data, please wait..');
			},
			success : function(data) {
				if (data.success) {
					window.location = site_url + 'user_management/notification';
				} else {
					$("#alert_table").css('display',"");
					$(".alert_msg").html(data.msg);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				$("#alert_table").css('display',"");
				$(".alert_msg").html('Processing data failed, contact administrator..');
			},
			async : false
		});
		return false;
	}

</script>