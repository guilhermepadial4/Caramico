<?php
 
  $nome = $_POST['Nome'];
  $assunto = $_POST['Assunto'];
  $email = $_POST['Email'];
  $Mensagem = $_POST['Mensagem'];
  
  
  $msg .= "Nome:\t $nome\n";
  $msg .= "Assunto:\t $assunto\n";
  $msg .= "Email:\t $email\n";
  $msg .= "Mensagem:\t $Mensagem\n";
  
  $remetente .= "no-reply@caramico.adv.br"; //email do remetente
  $headers .= "From: " .$remetente;
  
  mail("adm@caramico.adv.br","Contato Via Site",$msg,$headers); 
  
  /*copia para um novo endere&ccedil;o*/
  mail("adm@caramico.adv.br","Contato Via Site",$msg,$headers);
  
  echo "<h1 align=\"center\">Muito obrigado, $nome.</h1>";
  
  echo "<p align=\"center\">Agradecemos sua participa&ccedil;&atilde;o, entraremos em contato em breve</p>.";
 
?>