using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LP3_PARCIAL1
    {
    public partial class GestionCategorias : System.Web.UI.Page
        {
        protected void Page_Load ( object sender, EventArgs e )
            {

            }

        protected void btnAgregar_Click ( object sender, EventArgs e )
            {
            if ( !string.IsNullOrWhiteSpace(TextBoxCategoria.Text) )
                {
                int result = SqlDataCategorias.Insert();

                if ( result != 0 )
                    {
                    string script = "alert('Registro Agregado Correctamente!');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                    TextBoxCategoria.Text = "";
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

        protected void ListBox1_SelectedIndexChanged ( object sender, EventArgs e )
            {
            SqlDataCategorias2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader) SqlDataCategorias2.Select(DataSourceSelectArguments.Empty);
            if ( reader.Read() )
                {
                TextBoxCategoria.Text = reader["nombre"].ToString();
                }
            }

        protected void btnModificar_Click ( object sender, EventArgs e )
            {
            SqlDataCategorias.UpdateParameters["id"].DefaultValue = ListBox1.SelectedValue.ToString();
            SqlDataCategorias.UpdateParameters["nombre"].DefaultValue = TextBoxCategoria.Text;

            if ( !string.IsNullOrWhiteSpace(TextBoxCategoria.Text) )
                {

                int result = SqlDataCategorias.Update();

                if ( result != 0 )
                    {
                    string script = "alert('Registro Actualizado Correctamente! ');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    TextBoxCategoria.Text = "";
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

        protected void btnEliminar_Click ( object sender, EventArgs e )
            {
            if ( !string.IsNullOrWhiteSpace(TextBoxCategoria.Text) )
                {
                int result = SqlDataCategorias.Delete();

                if ( result != 0 )
                    {
                    string script = "alert('Registro Eliminado Correctamente!';)";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    TextBoxCategoria.Text = "";
                    }
                else
                    {
                    string script = "alert('Error!');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    }
                }
            else
                {
                string script = "alert('El campo Descripción no puede estar vacío.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                }
            }

        }
    }