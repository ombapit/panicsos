<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Notification extends CI_Controller {
	
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
		
		$data['title'] = APP_NAME."Notification Users";
		$data['notification_active'] = ' class="active"';
		
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
		$data['tpl_name'] = FCPATH.'application\modules\user_management\views\notification';
		$this->parser->parse("master.tpl", $data);
	}
	
	public function table_list()
	{
		$this->datatables->select('username,email,user_type_expiration,id')
			->edit_column('id', '$1', 'notification', 'callback_actions(id)')
            ->from('(SELECT a.*,
					(select group_name from v_user_groups aa
						where aa.user_id=a.id
					) group_name
					FROM `users` a
					) as datatable_table')
			->where('user_type_request = 1');
 
        echo $this->datatables->generate();
	}
	
	static public function callback_actions($id){
		return '<a class="btn btn-primary btn-sm" name="approve" href="javascript:void(0)" onclick="return confirm_ask(\'user_management/notification/approve\',\'Approve\','.$id.')">
					<i class="fa fa-check"></i> <span class="hidden-mobile">Approve</span>
				</a>
				<a class="btn btn-danger btn-sm" name="reject" href="javascript:void(0)" onclick="return confirm_ask(\'user_management/notification/reject\',\'Reject\','.$id.')">
					<i class="fa fa-minus"></i> <span class="hidden-mobile">Reject</span>
				</a>
				';
	}
	
	public function approve()
	{
		$this->check_group();
		
		$id = $this->uri->segment(4);
		//call model
		$data = $this->user_management_model->approve('users',$id);
		echo json_encode($data);
	}
	
	
	
	public function reject()
	{
		$this->check_group();
		
		$id = $this->uri->segment(4);
		//call model
		$data = $this->user_management_model->reject('users',$id);
		echo json_encode($data);
	}
	
	public function add_success()
	{
		$data['icon'] = "fa-user";
		$data['bc'] = "User Management <span>> Manage Users > Add User</span>";
		$data['module_alias'] = "User";
		$data['module_name'] = "user_management/users";
		// Load the template from the views directory
        $this->parser->parse("add_success.tpl", $data);
	}
	
	public function cron_status()
	{
		echo 'aw';
		echo json_encode($data);
	}
}