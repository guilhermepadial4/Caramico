<*?php
 
$nome = $_POST['Nome'];
 
$assunto = $_POST['Assunto'];
 
$email = $_POST['Email'];
 
$texto = $_POST['Mensagem'];
 
 
$msg .= "Nome:\t $nome\n";
 
$msg .= "Assunto:\t $assunto\n";
 
$msg .= "Email:\t $email\n";
 
$msg .= "Mensagem:\t $Mensagem\n";
 
 
$mensagem .= "$msg";
 
$remetente .= "email-do-remetente"; //email do remetente
 
$headers .= "From: " .$remetente;
 
 
mail("rogerio.quintela@hotmail.com","Contato Via Site",$mensagem,$headers); 
 
 
/*copia para um novo endereço*/
 
{
 
mail("rsquintela@voegol.com.br","Contato Via Site",$mensagem,$headers);
 
}
 
 
echo "<*H1 ALIGN=\"CENTER\">Muito obrigado, $nome.";
 
echo "<*P ALIGN=\"CENTER\">Agradecemos sua participação, entraremos em contato em breve>.
";
 
?> <*link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
 
 
echo '<*div class="col-md-4 text-center"><*P align="center"><*a href="contato-php.html"  class="btn btn-primary">Voltar
';
 
?>
 