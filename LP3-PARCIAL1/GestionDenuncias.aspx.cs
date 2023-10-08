using System;

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
                string script = "alert('El campo *Nombre Categoria* no puede estar vacío.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                }
            }

        protected void GridViewDenuncias_SelectedIndexChanged ( object sender, EventArgs e )
            {
            TextBoxDescripcion.Text = GridViewDenuncias.SelectedRow.Cells[2].Text;
            DropDownCategorias.SelectedValue = GridViewDenuncias.SelectedRow.Cells[3].Text;

            }

        protected void editarDenuncia_Click ( object sender, EventArgs e )
            {

            SqlDataDenuncias.Update();
            }
        }
    }
    