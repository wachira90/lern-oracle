## connect codeignitor

````
$db['oracle']['username'] = "scott"
$db['oracle']['password'] = "tiger"
$db['oracle']['hostname'] = "(DESCRIPTION =(ADDRESS_LIST =(ADDRESS =(PROTOCOL = TCP)(HOST = the_name_of_my_host)(PORT = 1521)))(CONNECT_DATA =(SID = my_sid_id)(SERVER = DEDICATED)))"

// $db['oracle']['database'] = 'forget all about this parameter';  // It's not used by the ORACLE driver.

$db['oracle']['dbdriver'] = 'oci8';
$db['oracle']['dbprefix'] = '';
$db['oracle']['pconnect'] = TRUE;
$db['oracle']['db_debug'] = FALSE;
$db['oracle']['cache_on'] = FALSE;
$db['oracle']['cachedir'] = '';
$db['oracle']['char_set'] = 'utf8';
$db['oracle']['dbcollat'] = 'utf8_general_ci';
$db['oracle']['swap_pre'] = '';
$db['oracle']['autoinit'] = TRUE;
$db['oracle']['stricton'] = FALSE;
````
