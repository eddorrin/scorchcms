<?php
  require 'includes/core/core.tpl.php';
  require 'includes/core/core.class.php';
  require 'includes/config.php';
  require 'includes/pathfile.php';

  $user = new user;
  $core = new core;
  
  define("UONLINE", $core->users_online(), true);
  
  $html = new Templates($_CONF['tpl']['theme']);
  
  session_start();

?>