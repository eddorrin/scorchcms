<?php

	error_reporting(E_ALL);
	ini_set('display_errors', true);
	set_include_path(__DIR__);
	
	require('global.php');
	$user->userReg();
	$html->template('register.html'); 
 
 
?>