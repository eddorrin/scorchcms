<?php
        if(isset($_SESSION['user_loggedin'])) {
         
        } else {
         header("Location:/index");
        }

	error_reporting(E_ALL);
	ini_set('display_errors', true);
	set_include_path(__DIR__);
	
	require('global.php');
	$html->template('me.html'); 
 
?>