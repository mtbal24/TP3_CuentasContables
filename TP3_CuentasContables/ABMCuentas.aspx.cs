using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP3_CuentasContables
{
    public partial class ABMCuentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ActualizarListaCuentas();
            }
            
        }

        protected void ActualizarListaCuentas()
        {
            DataView dv = (DataView) SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            StringBuilder tablaHtml = new StringBuilder();

            tablaHtml.Append("<table border='1' bordercolor='red'>");
            tablaHtml.Append("<tr>");
            tablaHtml.Append("<th> <b>Tipos de Cuentas</b></th>");
            tablaHtml.Append("</tr>");

            foreach (DataRowView rowView in dv)
            {
                DataRow row = rowView.Row;
                tablaHtml.Append("<tr>");
                tablaHtml.AppendFormat("<td>{0}</td>", row["descripcion"].ToString());
                tablaHtml.Append("</tr>");
            }

            tablaHtml.Append("</table>");

            Label2.Text = tablaHtml.ToString();

            //foreach (DataRowView dr in dv)
            //{
            //    DataRow row = dr.Row;
            //    Label2.Text += row["descripcion"].ToString() + " - ";
            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int result= SqlDataSource1.Insert();
            if (result != 0)
            {
                Label1.Text = "El tipo de cuenta se agregó exitosamente";
                ActualizarListaCuentas();
            }else {
                Label1.Text = "No se pudo agregar el tipo de cuenta";
                }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSourceWhere.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSourceWhere.Select(DataSourceSelectArguments.Empty);

            if (reader.Read())
            {
                TextBox2.Text = reader["descripcion"].ToString();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            int result = SqlDataSource1.Delete();
            if (result != 0)
            {
                Label3.Text = "Se eliminó el tipo de cuenta seleccionado";
                ActualizarListaCuentas();
                TextBox2.Text = "";
            }
            else
            {
                Label3.Text = "No se pudo eliminar el tipo de cuenta";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            int result = SqlDataSource1.Update();
            if (result != 0)
            {
                Label3.Text = "Se modificó el tipo de cuenta seleccionado";
                ActualizarListaCuentas();
                TextBox2.Text = "";
            }
            else
            {
                Label3.Text = "No se pudo modificar el tipo de cuenta";
            }
        }
    }
}