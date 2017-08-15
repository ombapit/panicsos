<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Settings_model extends CI_Model
{	
    public function get_param() {
        $q = $this->db->get('param');
        $d = $q->row_array();
        return $d;
    }
	public function update($table,$datas)
	{
		$data['param_value'] = $datas['smsc'];
        $this->db->where('param_name','smsc');
        $q = $this->db->update($table,$data);

		if($q){
			$data['success'] = true;
			$this->session->set_userdata('alert_msg','Data Updated Successfully');
		} else {
			$data['success'] = false;
			$data['msg'] = $this->db->_error_message();
			//$data['num'] = $this->db->_error_number();
		}
		return $data;
	}
}