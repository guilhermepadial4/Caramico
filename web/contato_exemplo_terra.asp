<!--METADATA TYPE="typelib" UUID="CD000000-8B95-11D1-82DB-00C04FB1625D"   NAME="CDO for Windows Library" -->
<!--METADATA TYPE="typelib" UUID="00000205-0000-0010-8000-00AA006D2EA4"   NAME="ADODB Type Library" -->
<% 
Response.CacheControl = "no-cache"
Response.AddHeader "Pragma", "no-cache"
Response.Expires = -1

if Request("submit") <> "" then 

	Dim objCDO 
	Set objCDO      = Server.CreateObject("CDO.Message") 

	Dim objCDOConf 
	Set objCDOConf  = Server.CreateObject("CDO.Configuration") 

' versão antiga que parou de funcionar em 01/08/2021
'      With objCDOConf.Fields 
'          .Item(cdoSendUsingMethod) = 2 
'          .Item(cdoSMTPServer) = "mail-fwd" 
'          .Item(cdoSMTPServerPort) = 25 
'          .Item(cdoSMTPconnectiontimeout) = 10 
'          .Update 
'      End With

	' versão NOVA em 06/08/2021
	'SERVIDOR DE SMTP 
	objCDOConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.terra.com.br" 
	 
	'PORTA PARA COMUNICAÇÃO COM O SERVIÇO DE SMTP 
	objCDOConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465 ' 465 ou 587 ou 25 (sem ssl)
	 
	'Utilização de SSl 
	objCDOConf.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = 1 ' 1=true 0=false
	 
	objCDOConf.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	' 1 = Send the message using the local SMTP service pickup directory.
	' 2 = Send the message using the network ( SMTP over the network).
	 
	'ATIVAR RECURSO DE SMTP AUTENTICADO 
	objCDOConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1  ' 1=basic
	' 0 = Perform no authentication.
	' 1 = Use the basic (clear text) authentication mechanism.
	' 2 = Use the NTLM authentication mechanism.
					   
	'USUARIO PARA SMTP AUTENTICADO 
	objCDOConf.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = "site@caramico.adv.br" 
	 
	'SENHA DO USUÁRIO PARA SMTP AUTENTICADO 
	objCDOConf.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "Site@123" 
	 
	'TEMPO DE TIMEOUT (EM SEGUNDOS) 
	objCDOConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 

	objCDOConf.Fields.update		  

	' ----------------------------------------------------------------------------------------

	Set objCDO.Configuration = objCDOConf 

	' remetente
	objCDO.From     = "caramico@caramico.adv.br"
	
	' destinatário
	objCDO.To       = "caramico@caramico.adv.br"  

	' assunto do email
	objCDO.Subject  = "FormMail from " & Request.ServerVariables("URL") 

	' corpo do email
	objCDO.TextBody = "FormMail from " & Request.ServerVariables("URL") 
	objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
	objCDO.TextBody = objCDO.TextBody & "Nome: " 
	objCDO.TextBody = objCDO.TextBody & Request("Nome") 
	objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
	objCDO.TextBody = objCDO.TextBody & "Assunto: " 
	objCDO.TextBody = objCDO.TextBody & Request("Assunto") 
	objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
	objCDO.TextBody = objCDO.TextBody & "Mensagem: " 
	objCDO.TextBody = objCDO.TextBody & Request("Mensagem") 
	objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
	objCDO.TextBody = objCDO.TextBody & "E-mail: " 
	objCDO.TextBody = objCDO.TextBody & Request("E-mail") 
	objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
	objCDO.TextBody = objCDO.TextBody & "Telefone: " 
	objCDO.TextBody = objCDO.TextBody & Request("Telefone") 
	objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
	objCDO.TextBody = objCDO.TextBody & "Empresa: " 
	objCDO.TextBody = objCDO.TextBody & Request("Empresa") 
	objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
	  
	' enviar o email.
	objCDO.Send 

	'Clean-up 
	Set objCDO     = Nothing  
	Set objCDOConf = Nothing  

	' Happy response. If you would rather, 
	' change the following to 
	' Response.Redirect "thanks.html" or similar 
	Response.Write "Sua mensagem foi enviada. Retornaremos em breve. Obrigado."  
	Response.End 

end if 
%> 
<html>
<style type="text/css">
<!--
.style7 {font-size: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; }
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.whatsapp-btn {
    position: fixed;
    bottom: 20px;
    right: 20px;
    width: 60px;
    height: 60px;
    z-index: 9999;
}

.whatsapp-btn img {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
    transition: transform 0.3s ease;
}

.whatsapp-btn:hover img {
    transform: scale(1.1);
}
-->
</style>
  <body>
    <form method=POST action="<%=Request.ServerVariables("URL")%>">
      <table border=0 cellspacing=0 cellpadding=5 bgcolor="#FFFFFF">
        <tr>
          <td><span class="style7">Nome:&nbsp;</span></td>
          <td><input type=textbox 
          name="Nome" size="50"></td>
        </tr>
        <tr>
          <td><span class="style7">Assunto:&nbsp;</span></td>
          <td><input type=textbox 
          name="Assunto" size="50"></td>
        </tr>
        <tr>
          <td><span class="style7">E-mail:&nbsp;</span></td>
          <td><input type=textbox 
          name="E-mail" size="50"></td>
        </tr>
        <tr>
          <td><span class="style7">Telefone:&nbsp;</span></td>
          <td><input type=textbox 
          name="Telefone" size="50"></td>
        </tr>
        <tr>
          <td><span class="style7">Empresa:&nbsp;</span></td>
          <td><input type=textbox 
          name="Empresa" size="50"></td>
        </tr>
        <tr>
          <td><span class="style7">Mensagem:&nbsp;</span></td>
          <td><textarea rows=5 cols=52 name="Mensagem"></textarea></td>
        </tr>
        <tr><td colspan=2 align=center><input 
          name=Submit type=submit id="Submit" value="Enviar"></td></tr>
      </table>
    </form>
	<a href="https://wa.me/551131051661" target="_blank" class="whatsapp-btn">
    <img src="https://cdn-icons-png.flaticon.com/512/220/220236.png" alt="WhatsApp">
</a>
  </body>
</html>
