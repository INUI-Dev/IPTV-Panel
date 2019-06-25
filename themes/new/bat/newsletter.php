<?php
	
/* Email Address */	
$to = '';

/* Subject */
$subject = 'Flatastic Newsletter Form';

/* Headers */
// $headers = 'From: Flatastic' . "\r\n" .
//     'Reply-To: flatastic@flatastic.com' . "\r\n" .
//     'X-Mailer: PHP/' . phpversion();

$email = $_POST['newsletter-email'];

if(isset($email) && !empty($email)){
	if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
		$message = 'Email: '.$email;
		echo mail($to, $subject, $message);
	}else{
		echo 2;
	}
	
}

?>