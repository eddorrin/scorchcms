<?php

  include 'includes/config.php';

  class user {

   public function _construct(){
    include 'includes/terminal.php';
    $this->db = new mysqli($_WSIGN['data']['host'], $_WSIGN['data']['user'], $_WSIGN['data']['pass'], $_WSIGN['data']['base']);
     if(mysqli_connect_errno()) {
      echo "Error: Could not connect to database.";
      exit;
     }
   }
   public function userReg() {

   include 'includes/config.php';
    $this->db = new mysqli($_CONF['data']['host'], $_CONF['data']['user'], $_CONF['data']['pass'], $_CONF['data']['name']);

    $core = new core();

    if(isset($_REQUEST['reg'])) {

     $user = $core->clean($_POST['username']);
     $pass = $core->secure($_POST['password']);
     $rpass = $core->secure($_POST['rpassword']);
     $email = $core->clean($_POST['email']);
     $gender = $core->clean($_POST['gender']);
     $credits = $_CONF['web']['cred'];
     $pixels = $_CONF['web']['pixe'];
     $pass = md5($pass);
     $rpass = md5($rpass);

     $sql = "SELECT * FROM users WHERE username='$user' OR mail='$email'";
     $check = $this->db->query($sql);
     $count_row = $check->num_rows;

     if($count_row < 1) {
      if($pass == $rpass) {
       if(!empty($user) && !empty($pass) && !empty($rpass) && !empty($email) && !empty($gender) && isset($user) && isset($pass) && isset($rpass) && isset($email) && isset($gender)) {
        $sql2 = "INSERT INTO users SET username='$user', password='$pass', mail='$email', gender='$gender', rank='1', credits='$credits', activity_points='$pixels'";
        $this->db->query($sql2);
        $_SESSION['user_loggedin'] = $user;
        echo "<div style='background-color:#4CC417;width: 100%;padding:1%;color:#FFF;'>Registration successful! If you're not redirected within 10 seconds, click <a href='/me'>here</a></div>";
       } else {
          echo "<div style='background-color:#C11B17;width: 100%;padding:1%;color:#FFF;'>Please fill in <b>all</b> fields!</div>";
       }
      } else {
        echo "<div style='background-color:#C11B17;width: 100%;padding:1%;color:#FFF;'>Passwords do not match. Please try again!</div>";
      }
     } else {
       echo "<div style='background-color:#C11B17;width: 100%;padding:1%;color:#FFF;'>User/Email already exist in our database. Please try again</div>.";
     }
    }
   }
  public function userLogin() {
    
     $core = new core();

   include 'includes/config.php';
    $this->db = new mysqli($_CONF['data']['host'], $_CONF['data']['user'], $_CONF['data']['pass'], $_CONF['data']['name']);

    if(isset($_REQUEST['login'])) {

    $user = $core->clean($_POST['uemail']);
    $pass = $core->secure($_POST['lpass']);
    $pass = md5($pass);

    $sql = "SELECT id FROM users WHERE username='$user' OR mail='$user' AND password='$pass'";
    $check = $this->db->query($sql);
    $count_row = $check->num_rows;
    $get_data = mysqli_fetch_array($check);
     if(isset($user) && isset($pass)) {
      if($count_row == 1) {
        if(!empty($user) && !empty($pass)) {
         header("Location:/me");
         $_SESSION['user_loggedin'] = $check;
         echo "<div style='background-color:#4CC417;width: 100%;padding:1%;color:#FFF;'>Login successful. If you're not redirected within 10 seconds, click <a href='{site_path}/me'>here</a>.</div>";
        } else {
           echo "<div style='background-color:#C11B17;width: 100%;padding:1%;color:#FFF;'>Please fill in both fields.</div>";
        }
      } else {
         echo "<div style='background-color:#C11B17;width: 100%;padding:1%;color:#FFF;'>Wrong username/password. Please try again!</div>";
      }
     }
    }
  }

  }
  class core {
  	
  	public function clean($str) {
  		
            include 'includes/config.php';
            $this->db = new mysqli($_CONF['data']['host'], $_CONF['data']['user'], $_CONF['data']['pass'], $_CONF['data']['name']);
            return stripslashes(htmlspecialchars($this->db->real_escape_string($str)));
        }
        
   public function secure($input) {
          
            return addslashes(htmlspecialchars(trim(strip_tags($input)))); 
            
        }
        
   public function users_online() {
   	
    include 'includes/config.php';
    $this->db = new mysqli($_CONF['data']['host'], $_CONF['data']['user'], $_CONF['data']['pass'], $_CONF['data']['name']);

    $sql = "SELECT * FROM server_status";
    $check = $this->db->query($sql);
    
    if($data = mysqli_fetch_array($check)) {
      return $data['users_online'];    
    }
   
   }
  	
  }

?>