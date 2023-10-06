<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="TP3_CuentasContables.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            GESTION DE CUENTAS CONTABLES</div>
        <div>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ABMCuentas.aspx">Gestionar Cuentas</asp:HyperLink> <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ABMRegistrosContables.aspx">Gestionar Resgistros Contables</asp:HyperLink>
        </div>
    </form>
</body>
</html>
