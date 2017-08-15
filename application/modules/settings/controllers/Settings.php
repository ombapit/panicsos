<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Settings extends CI_Controller {
	
	function __construct()
	{
		parent::__construct();
		if (!$this->ion_auth->logged_in())
		{
			//redirect them to the login page
			echo '<h4 style="margin-top:10px; display:block; text-align:left"><i class="fa fa-warning txt-color-orangeDark"></i> Your login is expired click <a href="'.base_url().'">here</a> to relogin.</h4>';
			die;
		}
        $this->load->model('settings_model');
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
		
		$data['title'] = APP_NAME."Settings";
		
		$data['settings_active'] = ' class="active"';
		
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
        
        $data['param'] = $this->settings_model->get_param();
        
		// Load the template from the views directory
		$data['tpl_name'] = FCPATH.'application\modules\settings\views\index';
		$this->parser->parse("master.tpl", $data);
	}
    
    public function update_param() {
        //privilege
		$this->check_group();
        
        //call model
		$data = $this->settings_model->update('param',$_POST);
		echo json_encode($data);
    }
    
    public function update_success()
	{
		$data['title'] = APP_NAME."Settings";
		$data['settings_active'] = ' class="active"';
		
		$data['icon'] = "fa-user";
		$data['bc'] = "Settings <span>> Manage Settings</span>";
		$data['module_alias'] = "Settings";
		$data['module_name'] = "settings";
		// Load the template from the views directory
        $data['tpl_name'] = FCPATH.'application\modules\settings\views\update_success';
		$this->parser->parse("master.tpl", $data);
	}
}