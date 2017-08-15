<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Change_pass extends CI_Controller {
	
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
		//admin priv
		$data['is_admin'] = 0;
		$group = array(1);
		if ($this->ion_auth->in_group($group)) {
			$data['is_admin'] = 1;
		}
		
		$data[''] = "";
		$id = $this->ion_auth->user()->row()->id;
		
		$data['title'] = APP_NAME."Change Password";
		
		$where = array("id"=>$id);
		
		$data['detail'] = $this->global_model->get_detail_data('users',$where);
		$data['csrf'] = form_hidden($this->global_model->_get_csrf_nonce());
		
		$data['chpass_active'] = ' class="active"';
		
		// Load the template from the views directory
		$data['tpl_name'] = FCPATH.'application\modules\user_management\views\change_pass';
		if ($data['is_admin'] == 1) {
			$this->parser->parse("master.tpl", $data);
		} else {
			$this->parser->parse("master_user.tpl", $data);
		}
	}
	
	public function add_success()
	{
		//admin priv
		$data['is_admin'] = 0;
		$group = array(1);
		if ($this->ion_auth->in_group($group)) {
			$data['is_admin'] = 1;
		}
		
		$data['title'] = APP_NAME."Success Change Password";
		
		$data['icon'] = "fa-user";
		$data['bc'] = "User Management <span>> Manage Users > Change Password</span>";
		$data['module_alias'] = "Password";
		$data['module_name'] = "user_management/change_pass";
		
		$data['chpass_active'] = ' class="active"';
		
		// Load the template from the views directory
		$data['tpl_name'] = FCPATH.'application\modules\user_management\views\chpass_success';
        if ($data['is_admin'] == 1) {
			$this->parser->parse("master.tpl", $data);
		} else {
			$this->parser->parse("master_user.tpl", $data);
		}
	}
}