<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_management_model extends CI_Model
{
	
	public function delete($module,$id)
	{
		$this->db->where('id',$id);
		$q = $this->db->delete($module);

		if($q){
			$data['success'] = true;
			$this->session->set_userdata('alert_msg','Data deleted Successfully');
		} else {
			$data['success'] = false;
			$data['msg'] = $this->db->_error_message();
			//$data['num'] = $this->db->_error_number();
		}
		return $data;
	}
	
	public function member_groups($id)
	{
		$html = '
			<div class="row">
				<h3>Member of groups</h3>
				<section class="col col-3">';
				
		$q = $this->db->get('groups');
		$d_q = $q->result_array();
		foreach ($d_q as $row) {
			$this->db->where('user_id',$id);
			$this->db->where('group_id',$row['id']);
			$q2 = $this->db->get('users_groups');
			$n_q = $q2->num_rows();
			if ($n_q > 0) {
				$check = ' checked="checked"';
			} else {
				$check = '';
			}
			$html .= '
					<label class="checkbox">
						<input type="checkbox" name="groups[]" value="'.$row['id'].'"'.$check.'>
						<i></i>'.$row['name'].'</label>
			';
		}
		$html .= '
				</section>
			</div>';
		return $html;
	}
	
	public function approve($module,$id)
	{
		$data['user_type'] = 'Premium';
		$data['user_type_request'] = 0;
		$this->db->where('id',$id);
		$q = $this->db->update($module,$data);

		if($q){
			$data['success'] = true;
			$this->session->set_userdata('alert_msg','Data Approved Successfully');
		} else {
			$data['success'] = false;
			$data['msg'] = $this->db->_error_message();
			//$data['num'] = $this->db->_error_number();
		}
		return $data;
	}
	
	public function reject($module,$id)
	{
		$data['user_type'] = 'Free';
		$data['user_type_set_date'] = null;
		$data['user_type_request'] = 0;
		$this->db->where('id',$id);
		$q = $this->db->update($module,$data);

		if($q){
			$data['success'] = true;
			$this->session->set_userdata('alert_msg','Data Rejected Successfully');
		} else {
			$data['success'] = false;
			$data['msg'] = $this->db->_error_message();
			//$data['num'] = $this->db->_error_number();
		}
		return $data;
	}
}
