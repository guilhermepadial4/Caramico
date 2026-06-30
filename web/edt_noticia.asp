<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
Response.Buffer = true
Response.Expires = -100
session.lcid = 1046
%>


<%if session("logado") <> "ok" then
response.redirect("admin.asp")
end if%>
<%

if Request.QueryString("Id") <> "" Then

    set cn = Server.CreateObject("ADODB.Connection")
    cn.provider= "Microsoft.Jet.OLEDB.4.0"
    cn.connectionstring=Server.MapPath("data\advocacia.mdb")
    cn.open

    SQL = "Select * from Noticias where Id = " & Request.QueryString("Id") & ""
    set rs = cn.execute(sql)

    intId = rs("Id")
    strTitulo = rs("Titulo")
    strFonte = rs("Fonte")
    strTexto = rs("Texto")
    
    strTexto = replace(strTexto,"<BR><BR>",chr(13)+chr(10))
    
    rs.Close
    Set rs = Nothing
    cn.Close
    Set cn = Nothing

End If

%>

<html>
    <head>
        <title>Caramico Advogados</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="JavaScript" type="text/JavaScript">
        <!--
            function MM_preloadImages() { //v3.0
                var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
                var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
                if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
            }

            function MM_swapImgRestore() { //v3.0
                var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
            }

            function MM_findObj(n, d) { //v4.01
                var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
                d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
                if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
                for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
                if(!x && d.getElementById) x=d.getElementById(n); return x;
            }

            function MM_swapImage() { //v3.0
                var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
                if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
            }
            
            function fncCancela(){
                document.location='lst_noticia.asp'; 
            }
            
            function fncExclui(Codigo){
                document.location='grv_noticia.asp?Del='+Codigo;  
            }
            
            function valida(){
                
                if(frmNoticia.txtTitulo.value==''){
                    alert('O T�tulo da Not�cia � Obrigat�rio!');
                    return;
                }   
                
                if(frmNoticia.txtFonte.value==''){
                    alert('O Autor da Not�cia � Obrigat�rio!');
                    return;
                }
                
                if(frmNoticia.txtTexto.value==''){
                    alert('O Texto da Not�cia � Obrigat�rio!');
                    return;
                }
                
                frmNoticia.submit();
                
            }
            
            //-->
        </script>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function MM_reloadPage(init) {  //reloads the window if Nav4 resized
                if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
                document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
                else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
            }
            MM_reloadPage(true);
            //-->
        </script>
    </head>
    <style>
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
</style>

    <body bgcolor="#007CC2" link="#333333" vlink="#0099FF" alink="#0066CC" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('imagens/botoes/botoes_blue_r1_c1.jpg','imagens/botoes/botoes_blue_r1_c2.jpg','imagens/botoes/botoes_blue_r1_c3.jpg','imagens/botoes/botoes_blue_r1_c4.jpg','imagens/botoes/botoes_blue_r1_c5.jpg','imagens/botoes/botoes_blue_r1_c6.jpg')">
        <table width="102%" height="194" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr> 
                <td background="imagens/img_index/fundo.jpg">
                    <table width="770" height="194" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                        <tr> 
                            <td height="21" valign="bottom">
                                <div align="center"> 
                                    <p><br>
                                    <img src="imagens/img_index/logo_caramico.gif" width="200" height="104"></p>
                                        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr> 
                                                <td>
                                                    <div align="right"><font color="#003366" size="2" face="Trebuchet MS"><strong><a href="index.asp">Home</a></strong></font></div>
                                                </td>
                                            </tr>
                                        </table>
                                    <br>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="102%" height="500" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr> 
                <td valign="top"> 
                    <table width="770" height="567" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                        <tr> 
                            <td height="21" valign="top">
                                <div align="center">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                  <td><div align="right"><a href="caramico.htm" onMouseOver="MM_swapImage('escritorio','','imagens/botoes/botoes_blue_r1_c1.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="imagens/botoes/botoes_r1_c1.jpg" name="escritorio" width="143" height="41" border="0" id="escritorio"></a></div></td>
                  <td><a href="areas_atuacao.htm" onMouseOver="MM_swapImage('atuacao','','imagens/botoes/botoes_blue_r1_c2.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="imagens/botoes/botoes_r1_c2.jpg" name="atuacao" width="142" height="41" border="0" id="atuacao"></a></td>
                  <td><a href="advogados.htm" onMouseOver="MM_swapImage('advogados','','imagens/botoes/botoes_blue_r1_c3.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="imagens/botoes/botoes_r1_c3.jpg" name="advogados" width="116" height="41" border="0" id="advogados"></a></td>
                  <td><a href="artigos.asp" onMouseOver="MM_swapImage('artigos','','imagens/botoes/botoes_blue_r1_c4.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="imagens/botoes/botoes_r1_c4.jpg" name="artigos" width="166" height="41" border="0" id="artigos"></a></td>
                  <td><a href="links.htm" onMouseOver="MM_swapImage('links','','imagens/botoes/botoes_blue_r1_c5.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="imagens/botoes/botoes_r1_c5.jpg" name="links" width="79" height="41" border="0" id="links"></a></td>
                  <td><a href="contato.htm" onMouseOver="MM_swapImage('contato','','imagens/botoes/botoes_blue_r1_c6.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="imagens/botoes/botoes_r1_c6.jpg" name="contato" width="124" height="41" border="0" id="contato"></a></td>
                </tr>
                                    </table>
                                    
                                
                                    <table width="700" height="200" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                            <td width="700">
                                                
                                                <div align="left">
                                                    <font color="#666666" size="2" face="Trebuchet MS"><br>
                                                    <font color="#003366"><strong>Cadastro de Artigos e Publica��es</strong></font><br>
                                                    <br>
                                                    <br>
                                                </div>
                                                <form name="frmNoticia" method="POST" action="grv_noticia.asp">
                                                <input type="hidden" name="txtId" value="<%=intId%>"/>
                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="70" align="right">T�tulo:&nbsp;</td>
                                                        <td width="630"><input type="text" name="txtTitulo" maxlength="100" size="60" value="<%=strTitulo%>"></td>
                                                    </tr>
                                                    <tr height="4"><td colspan="2"></td></tr>
                                                    <tr>
                                                        <td align="right">Autor:&nbsp;</td>
                                                        <td ><input type="text" name="txtFonte" size="60" maxlength="50" value="<%=strFonte%>"></td>
                                                    </tr>
                                                    <tr height="4"><td colspan="2"></td></tr>
                                                    <tr>
                                                        <td align="right" valign="top">Texto:&nbsp;</td>
                                                        <td ><textarea rows="10" name="txtTexto" cols="46"><%=strTexto%></textarea></td>
                                                    </tr>
                                                    <tr height="4"><td colspan="2"></td></tr>
                                                    <tr>
                                                        <td ></td>
                                                        <td >
                                                            <input type="button" value="Gravar" name="btnEnviar" size="40" onclick="valida()"/>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <input type="button" value="Cancelar" name="btnCancelar" size="40" onclick="fncCancela();"/>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <%If intId <> "" Then%>
                                                            <input type="button" value="Excluir" name="btnExcluir" size="40" onclick="fncExclui(<%=intId%>)"/>
                                                            <%End If%>
                                                        </td>
                                                    </tr>
                                                    <tr height="4"><td colspan="2"></td></tr>
                                                </table>
                                                </form>
                                            </td>
                                        </tr>
                                    </table>
                                    <br>
                                    <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                            <td><div align="center"><font color="#003366" size="2" face="Trebuchet MS"><strong><img src="imagens/img_index/linha_rodape.gif" width="770" height="7"></strong></font><font color="#666666" size="2" face="Trebuchet MS"><br>
                                                <font color="#003366">Fone 55 11 3242-7644 - Rua L&iacute;bero 
                      Badar&oacute;, 377 - 21&ordm;andar - cj. 2105 - S&atilde;o 
                      Paulo - SP</font></font></div></td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <a href="https://wa.me/551131051661" target="_blank" class="whatsapp-btn">
    <img src="https://cdn-icons-png.flaticon.com/512/220/220236.png" alt="WhatsApp">
</a>
    </body>
</html>
