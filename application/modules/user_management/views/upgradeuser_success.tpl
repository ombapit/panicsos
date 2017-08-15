<!-- widget grid -->
<section id="widget-grid" class="">
	<!-- START ROW -->
	<div class="row">
		<!-- NEW COL START -->
		<article class="col-sm-12 col-md-12 col-lg-12">
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget" id="wid-id-8" data-widget-editbutton="false" data-widget-custombutton="false">
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
					<h2>Message </h2>				
					
				</header>

				<!-- widget div-->
				<div>
					
					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->
						
					</div>
					<!-- end widget edit box -->
					
					<!-- widget content -->
					<div class="widget-body">
						<div class="message">
							<i class="fa fa-thumbs-up"></i>
							<p>{$module_alias} was successfully requested!</p>
							<p>
								Untuk Pembayaran, silahkan bayar ke rekening |nomor| a/n: |nama|
							</p>
							<nav>
								<a href="{php}echo base_url();{/php}{$module_name}" class="btn btn-default">
									Back to {$module_alias}
								</a>
							</nav>
						</div>						
					</div>
					<!-- end widget content -->
					
				</div>
				<!-- end widget div -->
				
			</div>
			<!-- end widget -->	
		</article>
		<!-- END COL -->		

	</div>

	<!-- END ROW -->

</section>