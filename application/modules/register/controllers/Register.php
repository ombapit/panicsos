<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Register extends CI_Controller {

	public function index()
	{
		if ($this->ion_auth->logged_in())
		{
			//redirect them to the login page
			redirect('cpanel', 'refresh');
		}
		
		// Some example data
        $data['title'] = APP_NAME."Register Page";
		
		$data['message'] = '';
		if ($this->session->flashdata('message') != "") {
			$data['message'] = '<div class="alert alert-danger fade in"><button data-dismiss="alert" class="close">×</button>
				'.$this->session->flashdata('message').'</div>';
		}
		$data['first_name'] = form_input(array('name' => 'first_name',
			'id' => 'first_name',
			'type' => 'text',
			'class' => 'form-control',
			'value' => $this->form_validation->set_value('first_name'),
		));
		$data['phone'] = form_input(array('name' => 'phone',
			'id' => 'phone',
			'type' => 'text',
			'class' => 'form-control',
			'value' => $this->form_validation->set_value('phone'),
		));
		$data['username'] = form_input(array('name' => 'username',
			'id' => 'username',
			'type' => 'text',
			'class' => 'form-control',
			'value' => $this->form_validation->set_value('username'),
		));
		$data['password'] = form_input(array('name' => 'password',
			'id' => 'password',
			'type' => 'password',
			'class' => 'form-control',
		));
		$data['password_confirm'] = form_input(array('name' => 'password_confirm',
			'id' => 'password_confirm',
			'type' => 'password',
			'class' => 'form-control',
		));
		$data['email'] = form_input(array('name' => 'email',
			'id' => 'email',
			'type' => 'email',
			'class' => 'form-control',
		));
		
        // Load the template from the views directory
        $this->parser->parse("register.tpl", $data);
	}
}