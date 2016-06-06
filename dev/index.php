<?php
        if(isset($_SESSION['user_loggedin'])) {

          header("Location:/me");
        }

	error_reporting(E_ALL);
	ini_set('display_errors', true);
	set_include_path(__DIR__);

	require('global.php');
	$user->userLogin();
        $html->template('index.html');

?>