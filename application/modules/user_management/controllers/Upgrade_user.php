<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Upgrade_user extends CI_Controller {
	
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
		$this->load->model('user_management_model');
	}
	
	public function index()
	{
		$data[''] = "";
		$data['title'] = APP_NAME."Send Request";
		
		$id = $this->ion_auth->user()->row()->id;
		
		$data['upgrade_active'] = ' class="active"';
		
		$where = array("id"=>$id);
		$data['detail'] = $this->global_model->get_detail_data('users',$where);
		$data['csrf'] = form_hidden($this->global_model->_get_csrf_nonce());
		
		for ($i=1;$i<=12;$i++) {
			$options2[$i] = $i;
		}
		$data['user_type_expiration'] = form_dropdown('user_type_expiration',$options2,@$data['detail']['user_type_expiration'],'class="form-control"');
		
		// Load the template from the views directory
		if ($data['detail']['user_type_request'] == 1) {
			$data['msg'] = 'Waiting Confirmation for Premium User';
			
			$data['tpl_name'] = FCPATH.'application\modules\user_management\views\waiting_user';
		}
		else if ($data['detail']['user_type_request'] == 0 and $data['detail']['user_type'] == 'Free') {
			$data['tpl_name'] = FCPATH.'application\modules\user_management\views\upgrade_user';
		} else {
			$data['msg'] = 'You Already Premium User until '.date('d-m-Y H:i:s',$data['detail']['user_type_set_date']);
			$data['tpl_name'] = FCPATH.'application\modules\user_management\views\waiting_user';
		}
		$this->parser->parse("master_user.tpl", $data);
	}
	
	public function add_success()
	{
		$data['title'] = APP_NAME."Success Sent Request";
		
		$data['icon'] = "fa-user";
		$data['bc'] = "User Management <span>> Manage Users > Upgrade User</span>";
		$data['module_alias'] = "Upgrade User";
		$data['module_name'] = "user_management/upgrade_user";
		
		// Load the template from the views directory
		$data['upgrade_active'] = ' class="active"';
		
		// Load the template from the views directory
		$data['tpl_name'] = FCPATH.'application\modules\user_management\views\upgradeuser_success';
        $this->parser->parse("master_user.tpl", $data);
	}
}