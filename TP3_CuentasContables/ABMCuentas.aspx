<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABMCuentas.aspx.cs" Inherits="TP3_CuentasContables.ABMCuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Volver al Menu</asp:HyperLink>
            <br />
            <br />
            <div align="center"> GESTION DE TIPOS DE CUENTAS</div>
<br />
<br />
<br />
<br />
            <asp:TextBox ID="TextBox1" runat="server" Width="162px" placeholder="Ingrese tipo de Cuenta"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Alta Nueva Cuenta" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
           
            <div> <asp:Label ID="Label2" runat="server"></asp:Label>
 <br />
 <br /></div>
            <asp:ListBox ID="ListBox1" runat="server" Width="271px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id" Height="105px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            <br />
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Modificar Cuenta" OnClick="Button2_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="Eliminar Cuenta" OnClick="Button3_Click" />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server"></asp:Label>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" ProviderName="<%$ ConnectionStrings:cadena.ProviderName %>" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="descripcion" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceWhere" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
