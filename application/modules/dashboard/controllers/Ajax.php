<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ajax extends CI_Controller {
	
	function __construct()
	{
		parent::__construct();
		if (!$this->ion_auth->logged_in())
		{
			//redirect them to the login page
			echo '<h4 style="margin-top:10px; display:block; text-align:left"><i class="fa fa-warning txt-color-orangeDark"></i> Your login is expired click <a href="'.base_url().'">here</a> to relogin.</h4>';
			die;
		}
		$this->load->model('ajax_model');
	}
	
	public function index()
	{
		//admin priv
		$is_admin = 0;
		$group = array(1);
		if ($this->ion_auth->in_group($group)) {
			$type = "Admin";
		}
		
		//public priv
		$is_public = 0;
		$group = array(17);
		if ($this->ion_auth->in_group($group)) {
			$user = $this->ion_auth->user()->row();
			$type = $user->user_type;
		}
		
		
		// Load the template from the views directory
		if ($type == "Admin") {
			$data['msg'] = "Welcome to ".$type." Panel";
			$this->parser->parse("admin.tpl", $data);
		} else {
			if ($type == "Free") {
				$this->parser->parse("free.tpl");
			} else if ($type == "Premium") {
				$this->parser->parse("premium.tpl");
			}
		}
	}
}