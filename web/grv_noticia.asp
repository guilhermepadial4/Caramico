<%
Response.Buffer = true
Response.Expires = -100
session.lcid = 1046
%>
<%

'response.write("Id="&Request.Form("txtId")&"<br>")
'response.write("Titulo="&Request.Form("txtTitulo")&"<br>")
'response.write("Data="&Request.Form("txtData")&"<br>")
'response.write("Fonte="&Request.Form("txtFonte")&"<br>")
'response.write("Texto="&Request.Form("txtTexto")&"<br>")
'response.end()

set cn = Server.CreateObject("ADODB.Connection")
cn.provider= "Microsoft.Jet.OLEDB.4.0"
cn.connectionstring=Server.MapPath("data\advocacia.mdb")
cn.open

if request.querystring("Del") <> "" then
    SQL = "delete from Noticias where Id = " & request.querystring("Del") & ""
    cn.execute(sql)
    Response.Redirect("lst_noticia.asp")
end if

intId = Request.Form("txtId")
strTitulo = Request.Form("txtTitulo")
strFonte = Request.Form("txtFonte")
strTexto = Request.Form("txtTexto")

'strTexto = replace(replace(strTexto,"<",""),">","")
strTexto = replace(strTexto,chr(13)+chr(10),"<BR><BR>")

'response.write(strTexto)
'response.end

If intId <> "" Then
    SQL = "update Noticias set Titulo = '" & strTitulo & "', "
    SQL = SQL & "Fonte = '" & strFonte & "', "
    SQL = SQL & "Texto = '" & strTexto & "' "
    SQL = SQL & "where Id = " & intId & ""
Else
    SQL = "Insert into Noticias(Titulo,Fonte,Texto) Values ('"&strTitulo&"','"&strFonte&"','"&strTexto&"')"
End If

'response.write(SQL)
'response.end

cn.execute(sql)

Response.Redirect("lst_noticia.asp")

Response.Write "Noticia cadastrada com sucesso"
%>

