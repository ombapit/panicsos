<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Chat_laporan extends CI_Controller {
	
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
		
		$data['title'] = APP_NAME."Chat Laporan";
		
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
		$data['tpl_name'] = FCPATH.'application\modules\log\views\chat_laporan';
		$this->parser->parse("master.tpl", $data);
	}
	
	public function table_list()
	{
		$this->datatables->select('image,pesan,nama,ktpsim,alamat,hp,pesan.created_date')
            ->edit_column('image', '$1', 'Chat_laporan', 'callback_actions(image)')
            ->from('pesan')
            ->join('data_penduduk','pesan.unik_id=data_penduduk.unik_id');
        $this->db->order_by("pesan.created_date","desc");
 
        echo $this->datatables->generate();
	}
    
    static public function callback_actions($gambar){
        if ($gambar != "") {
            $img = '<a class="fancybox" rel="group" href="data:image/jpeg;base64,'. $gambar .'">gambar</a>';
        } else {
            $img = "-";
        }
		return $img;
	}
    
    public function testing() {
        /* $filename = FCPATH."data.txt";
        touch($filename); */
        $this->db->where("id",2);
        $q = $this->db->get('pesan');
        $d = $q->row();
        $img = '<img src="data:image/jpeg;base64,'. $d->image .'"/>';
        echo $img;
    }
}