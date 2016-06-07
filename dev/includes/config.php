<?php
/*-----------------------------------------------------------*\
| Welcome to ScorchCMS configuration file.                    |
| Here you need to edit everything for the CMS to work as     |
| supposed. We will guide you through it!                     |
|-------------------------------------------------------------|
| Hope you enjoy. Sincerely, ScorchCMS dev team!              |
\*-----------------------------------------------------------*/

    $_CONF = array();
    
    /* Database connection */
    $_CONF['data']['host'] = "localhost"; //Usually localhost. Leave as is unless it doesn't work!
    $_CONF['data']['user'] = "root"; //Your database user, most use 'root' anyway.
    $_CONF['data']['pass'] = ""; //Password for user, duh! :)
    $_CONF['data']['name'] = "scorch"; //Now to name your database.. You uploaded a database right?
    
    /* Website setup */
    $_CONF['web']['name'] = "Scorch"; //The name of your hotel.
    $_CONF['web']['link'] = "http://localhost"; //Link your hotel. No ending slash (/)!
    $_CONF['web']['desc'] = "Best hotel ever!"; //Short description of hotel
    $_CONF['web']['meta'] = "best;hotel;ever;retro;scorch;fun;happy;entertaining;game;"; //Hotel tags for easier search functionalities.
    $_CONF['web']['logo'] = "includes/Scorch.gif"; //Custom Logo
    $_CONF['web']['cred'] = "10000"; //Starting credits. 10K by default.
    $_CONF['web']['pixe'] = "10000"; //Starting pixels. 10K by default.
    
    /* Templates */
    $_CONF['tpl']['theme'] = "Darkened"; 

    /* Client setup */
    $_CONF['swf']['habbo'] = ""; //Link to your habbo.swf file
    $_CONF['swf']['vars'] = ""; //Link to your external_vars.txt
    $_CONF['swf']['texts'] = ""; //Link to your external_texts.txt
    $_CONF['swf']['figur'] = ""; //Link to figuredata.txt (Not necessarily required)

    /* Aaaaaaand we're done! That's it. Easy as pie! Now go do something more productive... */
?>
