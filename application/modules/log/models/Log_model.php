<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Log_model extends CI_Model
{	
    public function alarm_data() {
        $this->db->order_by("a.created_date","desc");
        $this->db->where('status',1);
        $this->db->select("a.id_alarm,a.unik_id,a.jenis_laporan,a.lat,a.lon,a.created_date,b.nama,b.hp");
        $this->db->join("data_penduduk b","a.unik_id=b.unik_id");
        $q = $this->db->get('alarm a');
        $d = $q->result_array();
        return $d;
    }
    
    public function get_alarm_detail($id) {
        $this->db->where('id_alarm',$id);
        $this->db->select("a.id_alarm,a.unik_id,a.jenis_laporan,a.lat,a.lon,a.created_date,b.nama,b.hp");
        $this->db->join("data_penduduk b","a.unik_id=b.unik_id");
        $q = $this->db->get('alarm a');
        $d = $q->row_array();
        return $d;
    }
    
    public function stop_alarm($id) {
        $this->db->where('id_alarm',$id);
        $data['tombol_status'] = "mati";
        $data['status'] = 0;
        $q = $this->db->update('alarm',$data);
    }
}