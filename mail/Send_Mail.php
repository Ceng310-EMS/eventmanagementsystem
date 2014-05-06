<?php
function Send_Mail($to,$subject,$body)
{

    require 'PHPMailerAutoload.php';
    #$from       = "no-reply@fatiholayvar.com";
    $mail       = new PHPMailer();
    $mail->IsSMTP(true);            // use SMTP
    $mail->IsHTML(true);
    $mail->SMTPAuth   = true;                  // enable SMTP authentication
    $mail->Host       = "smtp.gmail.com"; // SMTP host
    $mail->Port       =  587;                    // set the SMTP port
    $mail->SMTPSecure = 'tls';
    $mail->Username   = "fatiholayvar@gmail.com";  // SMTP  username
    $mail->Password   = "eksibir.";  // SMTP password
    $mail->FromName = "Fatih Olay Var";
    #$mail->AddReplyTo($from,'From Name');
    $mail->Subject    = $subject;
    $mail->MsgHTML($body);
    $address = $to;
    $mail->AddAddress($address, $to);
    $mail->Send();
}
?>
}>
