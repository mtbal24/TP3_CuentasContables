using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP3_CuentasContables
{
    public partial class ABMRegistrosContables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerarTabla();
                
            }
        }
        protected void GenerarTabla()
        {
            
                DataView dv = (DataView)SqlDataSourceJoinCuenta.Select(DataSourceSelectArguments.Empty);


                if (dv != null && dv.Count > 0)
                {
                    // Rellenar cabecera
                    TableRow headerRow = new TableRow();

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "Id Registro";
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Cuenta";
                    headerRow.Cells.Add(headerCell2);

                    TableCell headerCell3 = new TableCell();
                    headerCell3.Text = "Monto";
                    headerRow.Cells.Add(headerCell3);

                    TableCell headerCell4 = new TableCell();
                    headerCell4.Text = "Tipo";
                    headerRow.Cells.Add(headerCell4);

                    Table1.Rows.Add(headerRow);

                    // Rellenar las filas
                    foreach (DataRowView rowView in dv)
                    {
                        DataRow row = rowView.Row;
                        TableRow tableRow = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = row["id"].ToString();
                        tableRow.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = row["descripcion"].ToString();
                        tableRow.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        cell3.Text = row["monto"].ToString();
                        tableRow.Cells.Add(cell3);

                        TableCell cell4 = new TableCell();
                        cell4.Text = row["tipo"].ToString();
                        tableRow.Cells.Add(cell4);

                        Table1.Rows.Add(tableRow);
                    }
                }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            int result = SqlDataSourceCrud.Insert();
            if (result != 0)
            {
                Label1.Text = "El registro contable se agregó exitosamente";
                GenerarTabla();
                TextBox1.Text = string.Empty; TextBox2.Text = string.Empty;
            }
            else
            {
                Label1.Text = "No se pudo agregar el registro contable";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            int result = SqlDataSourceCrud.Delete();
            if (result != 0)
            {
                Label3.Text = "Se eliminó el registro contable seleccionado";
                GenerarTabla();
                TextBox2.Text = "";
            }
            else
            {
                Label3.Text = "No se pudo eliminar el registro";
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSourceWhereDrop2.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                DataRowView row = dv[0];
                TextBox1.Text = row["monto"].ToString();
                DropDownList1.SelectedValue = row["idCuenta"].ToString();
                TextBox2.Text = row["tipo"].ToString();
            }
            GenerarTabla();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            SqlDataSourceCrud.UpdateParameters["id"].DefaultValue = DropDownList2.SelectedValue;
            int result = SqlDataSourceCrud.Update();
            if (result != 0)
            {
                Label3.Text = "Se modificó el registro seleccionado";
                GenerarTabla();
                TextBox1.Text = string.Empty; TextBox2.Text = string.Empty;
            }
            else
            {
                Label3.Text = "No se pudo modificar el registro";
            }
        }
    }
}