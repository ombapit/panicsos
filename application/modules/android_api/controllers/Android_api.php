<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Android_api extends CI_Controller {
	
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		echo "PANIC SOS API";
	}
    
    public function getsmscenter() {
        $this->db->where("param_name","smsc");
        $q = $this->db->get("param");
        $smsc = $q->row()->param_value;
        echo $smsc;
    }
    
    public function kirim_pesan() {
        if($_SERVER['REQUEST_METHOD']=='POST'){
            if (@$_POST['image']) {
                $data['image'] = $_POST['image'];
            }
            $data['pesan'] = $_POST['pesan'];
            $data['unik_id'] = $_POST['device_id'];
            $data['created_date'] = date("Y-m-d H:i:s");
            
            $q = $this->db->insert("pesan",$data);
            if ($q) { echo "ok";} else { echo "nok";}
        } else{
            echo "nok";
        }
    }
    
    public function hit_alarm() {
        if($_SERVER['REQUEST_METHOD']=='POST'){
            if ($_POST['tombol_status'] == "hidup") {
                $data['tombol_status'] = $_POST['tombol_status'];
                $data['jenis_laporan'] = $_POST['jenis_laporan'];
                $data['unik_id'] = $_POST['device_id'];
                $data['lat'] = $_POST['lat'];
                $data['lon'] = $_POST['lon'];
                $data['created_date'] = date("Y-m-d H:i:s");
                
                $q = $this->db->insert("alarm",$data);
                if ($q) { echo "ok";} else { echo "nok";}
                
                $filename = FCPATH."data.txt";
                touch($filename);
            } else if ($_POST['tombol_status'] == "mati") {
                $unik_id = $_POST['device_id'];
                
                $data['tombol_status'] = $_POST['tombol_status'];
                $data['status'] = 0;
                
                $this->db->where("unik_id",$unik_id);
                $q = $this->db->update("alarm",$data);
                if ($q) { echo "ok";} else { echo "nok";}
                
                $filename = FCPATH."data.txt";
                touch($filename);
            }
        } else{
            echo "nok";
        }
    }
    
    public function save_profile() {
        if($_SERVER['REQUEST_METHOD']=='POST'){
            //check data
            $this->db->select("count(1) cnt");
            $this->db->where("unik_id",$_POST['device_id']);
            $q = $this->db->get("data_penduduk");
            $total = $q->row()->cnt;
            //insert mode
            if ($total == 0) {
                $data['unik_id'] = $_POST['device_id'];
                $data['nama'] = $_POST['nama'];
                $data['ktpsim'] = $_POST['ktpsim'];
                $data['alamat'] = $_POST['alamat'];
                $data['hp'] = $_POST['hp'];
                $data['created_date'] = date("Y-m-d H:i:s");
                $data['updated_date'] = date("Y-m-d H:i:s");
                
                $q = $this->db->insert("data_penduduk",$data);
                if ($q) { echo "ok";} else { echo "nok";}
            } else { //edit mode
                $unik_id = $_POST['device_id'];
                $data['nama'] = $_POST['nama'];
                $data['ktpsim'] = $_POST['ktpsim'];
                $data['alamat'] = $_POST['alamat'];
                $data['hp'] = $_POST['hp'];
                $data['updated_date'] = date("Y-m-d H:i:s");
                
                $this->db->where("unik_id",$unik_id);
                $q = $this->db->update("data_penduduk",$data);
                if ($q) { echo "ok";} else { echo "nok";}
            }
        } else{
            echo "nok";
        }
    }
}