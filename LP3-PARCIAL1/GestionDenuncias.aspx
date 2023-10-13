<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionDenuncias.aspx.cs" Inherits="LP3_PARCIAL1.GestionDenuncias" ValidateRequest="false" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>GESTION DENUNCIAS</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 800px;
            margin: auto;
        }
        .mt-4 {
            margin-top: 1.5rem !important;
        }
        .form-group {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body class="bg-light text-center">
    <form id="form1" runat="server" class="container">
        <div>
            <h1 class="mt-4">GESTION DE DENUNCIAS</h1>
        </div>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Categoria: " ></asp:Label>
            <asp:DropDownList ID="DropDownCategorias" runat="server" DataSourceID="SqlDataCategoria"  DataTextField="nombre" DataValueField="id" CssClass="form-control">
              
            </asp:DropDownList>
            <asp:Button ID="btnFiltrar" runat="server"  CssClass="btn btn-info mt-2" Text="Filtrar" OnClick="btnFiltrar_Click" /><asp:Button ID="btnLimpiarFiltro" runat="server"  CssClass="btn btn-secondary mt-2 ml-2" Text="Limpiar Filtro" OnClick="btnLimpiarFiltro_Click" />
        </div>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Descripcion: "></asp:Label>
            <asp:TextBox ID="TextBoxDescripcion" placeholder="Ingrese descripción de su denuncia" class="form-control form-control-lg mt-2" runat="server" TextMode="MultiLine"></asp:TextBox>
    
        </div>
        <asp:Button ID="agregarDenuncia" runat="server" Text="Nueva Denuncia" CssClass="btn btn-primary" OnClick="agregarDenuncia_Click" />
           <asp:Button ID="editarDenuncia" CssClass="btn btn-warning" runat="server" Text="Actualizar" OnClick="editarDenuncia_Click" />
<asp:GridView ID="GridViewDenuncias" runat="server" CssClass="table table-striped table-bordered mt-4" AutoGenerateColumns="False" DataKeyNames="id,Expr1" DataSourceID="SqlDataDenuncias" OnSelectedIndexChanged="GridViewDenuncias_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
        <asp:BoundField DataField="texto" HeaderText="Descripcion" SortExpression="texto" />
        <asp:BoundField DataField="idDenunciaCategoria" SortExpression="idDenunciaCategoria" />
        <asp:BoundField DataField="nombre" HeaderText="Categoria" SortExpression="nombre" />
        <asp:BoundField DataField="Expr1" HeaderText="ID Cat" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" />
        <asp:CommandField ShowSelectButton="True" ButtonType="Button" ShowDeleteButton="True" AccessibleHeaderText="Acciones" HeaderText="Seleccione Opción" />
    </Columns>
</asp:GridView>

     

        <asp:SqlDataSource ID="SqlDataCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [DenunciaCategorias] WHERE [id] = @id" InsertCommand="INSERT INTO [DenunciaCategorias] ([nombre]) VALUES (@nombre)" SelectCommand="SELECT id, nombre FROM DenunciaCategorias" UpdateCommand="UPDATE [DenunciaCategorias] SET [nombre] = @nombre WHERE [id] = @id" >
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataDenuncias" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Denuncias] WHERE [id] = @id" InsertCommand="INSERT INTO [Denuncias] ([texto], [idDenunciaCategoria]) VALUES (@texto, @idDenunciaCategoria)" SelectCommand="SELECT Denuncias.id, Denuncias.texto, Denuncias.idDenunciaCategoria, DenunciaCategorias.nombre, DenunciaCategorias.id AS Expr1 FROM Denuncias INNER JOIN DenunciaCategorias ON Denuncias.idDenunciaCategoria = DenunciaCategorias.id" UpdateCommand="UPDATE [Denuncias] SET [texto] = @texto, [idDenunciaCategoria] = @idDenunciaCategoria WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBoxDescripcion" Name="texto" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="DropDownCategorias" Name="idDenunciaCategoria" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TextBoxDescripcion" Name="texto" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="DropDownCategorias" Name="idDenunciaCategoria" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GridViewDenuncias" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    </body>
        <!-- Scripts de Bootstrap (jQuery y Popper.js) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>

    <!-- Script de Bootstrap -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>
