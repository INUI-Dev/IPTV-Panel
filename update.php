<?php
include('config/config.php');

function execute_file($file,$hostname_portfolio,$username_portfolio,$password_portfolio,$database_portfolio) {
 
      // executes the SQL commands from an external file.
	  $portfolio = mysqli_connect($hostname_portfolio, $username_portfolio, $password_portfolio) or trigger_error(mysqli_error($portfolio),E_USER_ERROR); 
      mysqli_connect($hostname_portfolio, $username_portfolio, $password_portfolio);
	  mysqli_select_db($portfolio, $database_portfolio);
      if (!file_exists($file)) {
         return false;
      }
      $str = file_get_contents($file);
      if (!$str) {
         return false; 
      }
      
      // split all the queries into an array
      $quote = '';
      $line = '';
      $sql = array();
      $ignoreNextChar = '';
	  for ($i = 0; $i < strlen($str); $i++) {
          if ( !$ignoreNextChar ) {
              $char = substr($str, $i, 1);
              $line .= $char;
              if ($char == ';' && $quote == '') {
                  $sql[] = $line;
                  $line = '';
              } else if ( $char == '\\' ) {
                  // Escape char; ignore the next char in the string
                  $ignoreNextChar = TRUE;
              } else if ($char == '"' || $char == "'" || $char == '`') {
                  if ( $quote == '' )         // Start of a new quoted string; ends with same quote char
                      $quote = $char;
                  else if ( $char == $quote ) // Current char matches quote char; quoted string ends
                      $quote = '';
              }
          }
          else
		  
		  
              $ignoreNextChar = FALSE;
      }
      
      if ($quote != '') return false;

      foreach ($sql as $query) {
         if (!empty($query)) {
            $r = mysqli_query($portfolio,$query);
 
            
         }
      }
	  return true;
    
   }  
execute_file("sql2.sql",'localhost',username_portfolio,password_portfolio,database_portfolio);
