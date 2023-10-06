<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABMRegistrosContables.aspx.cs" Inherits="TP3_CuentasContables.ABMRegistrosContables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
 <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left: 40px">
            
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Volver al Menu</asp:HyperLink>
            <div align="center"> GESTION DE REGISTROS CONTABLES</div>
            <br />
            <br />
            <br />
            <br />
&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" Height="32px" Width="186px" placeholder="Tipo de Cuenta" DataSourceID="SqlDataSourceListaCuentas" DataTextField="descripcion" DataValueField="id">
            </asp:DropDownList>
&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Width="169px" placeholder="Ingrese el Monto"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" placeholder="Ingrese Tipo" Tooltip="Debe: Ingrese 0 Haber: Ingrese 1"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Agregar Registro Contable" OnClick="Button1_Click" />
            <asp:Label ID="Label2" runat="server" Text="*Ingrese 0 -Debe o 1- Haber" ForeColor="Red"></asp:Label>
            <br />
            <br />
        &nbsp;
            &nbsp;&nbsp;
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCrud" DataTextField="id" DataValueField="id" Height="44px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="405px" >
               
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Modificar Registro" OnClick="Button2_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Eliminar Registro" />
            <br />
            <asp:Label ID="Label3" runat="server"></asp:Label>
            <br />
            <br />
        </div>

        <div style="margin-left: 40px">
            <asp:Table ID="Table1" CssClass="table" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" GridLines="Both"></asp:Table>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceListaCuentas" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCrud" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [monto], [tipo]) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT * FROM [RegistrosContables]" UpdateCommand="UPDATE [RegistrosContables] SET [idCuenta] = @idCuenta, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox2" Name="tipo" PropertyName="Text" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox2" Name="tipo" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceJoinCuenta" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT RegistrosContables.id, RegistrosContables.idCuenta, RegistrosContables.monto, RegistrosContables.tipo, Cuentas.descripcion FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idCuenta = Cuentas.id"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceWhereDrop2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [monto], [tipo]) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT * FROM [RegistrosContables] WHERE ([id] = @id)" UpdateCommand="UPDATE [RegistrosContables] SET [idCuenta] = @idCuenta, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="tipo" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="tipo" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    
</body>
</html>
