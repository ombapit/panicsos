<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Cpanels extends CI_Controller {
	
	function __construct()
	{
		parent::__construct();
		if (!$this->ion_auth->logged_in())
		{
			//redirect them to the login page
			redirect('login', 'refresh');
		}
	}
	public function index()
	{
		//data user login
		$user = $this->ion_auth->user()->row();
		$data['user'] = $user;
		
        $data['title'] = APP_NAME."Cpanel Page";
		
		//admin priv
		$data['is_admin'] = 0;
		$group = array(1);
		if ($this->ion_auth->in_group($group)) {
			$data['is_admin'] = 1;
		}
		
		//public priv
		$data['is_public'] = 0;
		$group = array(17);
		if ($this->ion_auth->in_group($group)) {
			$data['is_public'] = 1;
		}
		
        // Load the template from the views directory
		if ($data['is_admin'] == 1) {
			$data['tpl_name'] = "admin";
			$this->parser->parse("cpanel.tpl", $data);
		} else {
			if ($user->user_type == "Free") {
				$data['tpl_name'] = "user_free";
			} else if ($user->user_type == "Premium") {
				$data['tpl_name'] = "user_premium";
			}
			$this->parser->parse("user.tpl", $data);
			
		}
	}
}