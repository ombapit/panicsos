<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Alarm_log extends CI_Controller {
	
	function __construct()
	{
		parent::__construct();
		if (!$this->ion_auth->logged_in())
		{
			//redirect them to the login page
			echo '<h4 style="margin-top:10px; display:block; text-align:left"><i class="fa fa-warning txt-color-orangeDark"></i> Your login is expired click <a href="'.base_url().'">here</a> to relogin.</h4>';
			die;
		}
		
		$this->load->library('Datatables');
	}
	
	public function check_group() {
		$group = array(1);
		if (!$this->ion_auth->in_group($group)) {
			echo '<h4 style="margin-top:10px; display:block; text-align:left"><i class="fa fa-warning txt-color-orangeDark"></i> You must be a part of group admin to process this action.</h4>';
			die;
		}
	}
	
	public function index()
	{
		//privilege
		$this->check_group();
		
		$data['title'] = APP_NAME."Alarm Log";
		
		$data['log_active'] = ' class="active"';
		
		//check session alert
		$alert = $this->session->userdata('alert_msg');
		$this->session->unset_userdata('alert_msg');
		$alert != "" ? $disp = '' : $disp = 'display: none;';
		$data['alert_block'] = '
			<div class="alert alert-block alert-success" style="'.$disp.'" id="alert_table">
				<a href="#" data-dismiss="alert" class="close">×</a>
				<h4 class="alert-heading"><i class="fa fa-check-square-o"></i> Alert!</h4>
				<p class="alert_msg">'.$alert.'</p>
			</div>
		';
		// Load the template from the views directory
		$data['tpl_name'] = FCPATH.'application\modules\log\views\alarm_log';
		$this->parser->parse("master.tpl", $data);
	}
	
	public function table_list()
	{
		$this->datatables->select('a.unik_id,a.jenis_laporan,b.nama,b.ktpsim,b.hp,concat(a.lat,",",a.lon) kordinat,a.tombol_status,a.created_date')
            ->from('alarm a')
            ->join('data_penduduk b','a.unik_id=b.unik_id');
        $this->db->order_by("a.created_date", "desc");
 
        echo $this->datatables->generate();
	}
}