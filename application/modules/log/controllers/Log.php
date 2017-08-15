<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Log extends CI_Controller {
	
	function __construct()
	{
		parent::__construct();
		if (!$this->ion_auth->logged_in())
		{
			//redirect them to the login page
			echo '<h4 style="margin-top:10px; display:block; text-align:left"><i class="fa fa-warning txt-color-orangeDark"></i> Your login is expired click <a href="'.base_url().'">here</a> to relogin.</h4>';
			die;
		}
        $this->load->model('log_model');
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
		
		$data['title'] = APP_NAME."Log";
		
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
		$data['tpl_name'] = FCPATH.'application\modules\log\views\index';
		$this->parser->parse("master.tpl", $data);
	}
    
    public function alarm_list() {
        //privilege
		$this->check_group();
        
        $alarms = $this->log_model->alarm_data();
        
        $html = '';
        $bunyi = 0;
        foreach ($alarms as $alarm) {
            $html .= "<tr>";
            $html .= "<td>{$alarm['jenis_laporan']}</td>";
            $html .= "<td>{$alarm['nama']}</td>";
            $html .= "<td>{$alarm['hp']}</td>";
            $html .= '<td><a class="fancybox fancybox.iframe" rel="group" href="'.base_url().'log/buka_peta/'.$alarm['id_alarm'].'">Peta</a></td>';
            $html .= "<td>{$alarm['lat']},{$alarm['lon']}</td>";
            $html .= "<td>{$alarm['created_date']}</td>";
            $html .= '<td><a href="'.base_url().'/log/stop_alarm/'.$alarm['id_alarm'].'">Matikan Alarm</a></td>';
            $html .= "</tr>";
            $bunyi = 1;
        }
        $data['html'] = $html;
        $data['bunyi'] = $bunyi;
        
        $kordinat = array();
        foreach ($alarms as $alarm) {
            $info = "<b>Koordinat ".$alarm['nama']."<br/>No HP: ".$alarm['hp']." <br/>Latlon: {$alarm['lat']}, {$alarm['lon']}</b>";
            $kordinat[] = array("lat"=>$alarm['lat'],"lon"=>$alarm['lon'],"info"=>$info);
        }
        $data['latlon'] = $kordinat;
        echo json_encode($data);
    }
    
    public function buka_peta($id) {
        //privilege
		$this->check_group();
                
        $data['detail'] = $this->log_model->get_alarm_detail($id);
        
        $this->load->view("peta",$data);
    }
    
    public function stop_alarm($id) {
        //privilege
		$this->check_group();
        
        $this->log_model->stop_alarm($id);
        
        redirect('/log', 'refresh');
    }
}