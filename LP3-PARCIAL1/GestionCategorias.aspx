<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionCategorias.aspx.cs" Inherits="LP3_PARCIAL1.GestionCategorias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>GESTION CATEGORIAS DENUNCIAS</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light text-center">
    <form id="form1" runat="server" class="container mt-5 text-center">
        <h1 class="mt-4">GESTION CATEGORIAS DE DENUNCIAS</h1>

        <div class="form-group d-inline-block">
            <label for="TextBox1">Nombre Categoria: * </label>
            <asp:TextBox ID="TextBoxCategoria" runat="server" class="form-control"></asp:TextBox>


            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary ml-2 mt-2" OnClick="btnAgregar_Click" />
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning ml-2 mt-2" OnClick="btnModificar_Click" />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger ml-2 mt-2" OnClick="btnEliminar_Click" OnClientClick="return confirmarEliminacion();" />
        </div>

        <div class="row justify-content-center mt-4">
            <div class="col-6">
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataCategorias" DataTextField="nombre" DataValueField="id" CssClass="form-control" Height="224px" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [DenunciaCategorias] WHERE [id] = @id" InsertCommand="INSERT INTO [DenunciaCategorias] ([nombre]) VALUES (@nombre)" ProviderName="<%$ ConnectionStrings:cadena.ProviderName %>" SelectCommand="SELECT * FROM [DenunciaCategorias]" UpdateCommand="UPDATE [DenunciaCategorias] SET [nombre] = @nombre WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBoxCategoria" Name="nombre" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataCategorias2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [DenunciaCategorias] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
          <!-- Scripts de Bootstrap (jQuery y Popper.js) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>

        <!-- Script de Bootstrap -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- Alerta Eliminacion -->
        <script type="text/javascript">
            function confirmarEliminacion() {
                var confirmacion = confirm('¿Estás seguro de que quieres eliminar este registro?');
                return confirmacion;
            }
        </script>
</body>
</html>
