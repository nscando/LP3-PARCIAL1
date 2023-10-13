using System;
using System.IO;
using System.Web.UI.WebControls;

namespace LP3_PARCIAL1
    {
    public partial class GestionDenuncias : System.Web.UI.Page
        {
        protected void Page_Load ( object sender, EventArgs e )
            {

            }

        private void LimpiarControles ()
            {

            DropDownCategorias.SelectedIndex = 0;
            TextBoxDescripcion.Text = "";

            }

        protected void agregarDenuncia_Click ( object sender, EventArgs e )
            {
            if ( !string.IsNullOrWhiteSpace(TextBoxDescripcion.Text) && DropDownCategorias.SelectedIndex >= 0 )
                {
                int result = SqlDataDenuncias.Insert();
                GridViewDenuncias.DataBind();


                if ( result != 0 )
                    {

                    string fechaHoraActual = DateTime.Now.ToString("yyyyMMdd_HHmmss");

                    StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/denuncias.txt", true);
                    streamWriter.WriteLine("Fecha y Hora de Inserción: " + fechaHoraActual.ToString());
                    streamWriter.WriteLine("Categoria:");
                    streamWriter.WriteLine(DropDownCategorias.SelectedItem.Text);
                    streamWriter.WriteLine("Descripción:");
                    streamWriter.WriteLine(DropDownCategorias.SelectedItem.Text);
                    streamWriter.WriteLine(TextBoxDescripcion.Text);
                    streamWriter.WriteLine(); 
                    streamWriter.WriteLine("------------------------------");
                    streamWriter.Close();


                    string script = "alert('Registro Agregado Correctamente!');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    LimpiarControles();

                    }
                else
                    {
                    string script = "alert('Error!');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    }
                }
            else
                {
                string script = "alert('El campo *Descripción* no puede estar vacío.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                }
            }

        protected void GridViewDenuncias_SelectedIndexChanged ( object sender, EventArgs e )
            {
            TextBoxDescripcion.Text = GridViewDenuncias.SelectedRow.Cells[1].Text;
            DropDownCategorias.SelectedValue = GridViewDenuncias.SelectedRow.Cells[4].Text;

            }

        protected void editarDenuncia_Click ( object sender, EventArgs e )
            {

            SqlDataDenuncias.Update();
            GridViewDenuncias.DataBind();
            }

        protected void btnFiltrar_Click ( object sender, EventArgs e )
            {
            SqlDataDenuncias.FilterExpression = "idDenunciaCategoria = " + DropDownCategorias.SelectedValue;
            }

        protected void btnLimpiarFiltro_Click ( object sender, EventArgs e )
            {
            SqlDataDenuncias.FilterExpression = "";
            SqlDataDenuncias.FilterParameters.Clear();

            }


        }
    }
