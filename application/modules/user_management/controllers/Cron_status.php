<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Cron_status extends CI_Controller {
	
	function __construct()
	{
		parent::__construct();
		$this->load->model('user_management_model');
	}
	
	public function index()
	{
		$curr_date = time();
		$this->db->where('user_type','Premium');
		$this->db->where("user_type_set_date <> ",0);
		$this->db->where("user_type_set_date < ",$curr_date);
		$q = $this->db->get('users');
		$d = $q->result_array();
		
		if (!empty($d)) {
			foreach ($d as $row) {
				$id = $row['id'];
				
				//update user jadi Free lagi
				$data['user_type'] = 'Free';
				//$this->db->update('users',$data);
				
				echo 'User '.$row['username']. ' Updated to Free<br/>';
			}
		} else {
			echo 'No Data Expired Found';
		}
	}
}