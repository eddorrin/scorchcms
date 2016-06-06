<?php
 /* 
   Author Oleaa
   Coded for Raz0r.
 */
 include 'includes/config.php';
 class Templates {
 	private $theme;
   private $keys = array(
    //all tags here
    'welcome_message' => 'Welcome to This simple template system',
    'login_first' => 'Login',
    'logo' => '<img src="images/logo.png">',
    'site_name' => SNAME,
    'site_path' => SPATH,
    'site_logo' => SLOGO,
    'users_online' => UONLINE,
    'habbo_swf' => SWF,
    'external_vars' => VARS,
    'external_texts' => TEXT,
    'figuredata' => FIG
   );
   
   
   public function __construct($theme)
   {
   	
   	$this->theme = $theme;
   
   }
   
   public function getTheme()
   {
   	return $this->theme;
   }
   
   public function setTheme($theme)
   {
		$this->theme = $theme;
   }
   
   private function filter_keys($str) {
		$abc = [];
		foreach($this->keys as $key => $value)
			$abc['{' . $key . '}'] = $value;

		return str_ireplace(array_keys($abc), array_values($abc), $str);

   }
   
   public function add_key($name, $value) {
     $this->keys[$key] = $value;
     return true;
   }
   
   public function template($template) {
   	$content = null;
   	$path = 'includes/tpl/' . $this->theme . '/' . $template;
   	if(!$content = @file_get_contents($path))
   		throw new Exception('Could not find template `' . $template . '` (current directory `' . get_include_path() . '`)', E_WARNING);

		echo $this->filter_keys($content);
   }
 }
?>