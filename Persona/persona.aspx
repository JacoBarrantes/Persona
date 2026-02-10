<%@ Page Title="Persona" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="persona.aspx.vb" Inherits="Persona.persona" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%--nombre--%>
    <div class="form-group">
        <asp:Label ID="lblNombre" runat="server" Text="Nombre Completo:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server"  placeholder="Nombre Completo" CssClass="form-control"></asp:TextBox>
    </div>

             <%--Validar Apellido--%>
    <asp:RequiredFieldValidator ID="rfvNombre" runat ="server"
        CssClass="text-danger"
        Display="Dynamic"
        ControlToValidate="txtNombre"
        ErrorMessage="Es necesario indicar el nombre">
    </asp:RequiredFieldValidator>

    <%--apellido--%>
    <div class="form-group">
        <asp:Label ID="LabelApellido" runat="server" Text="Apellido:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="TxtApellido" runat="server" placeholder="Nombre Completo" CssClass="form-control"></asp:TextBox>
    </div>

         <%--Validar Apellido--%>
    <asp:RequiredFieldValidator ID="rfvApellido" runat ="server"
        CssClass="text-danger"
        Display="Dynamic"
        ControlToValidate="TxtApellido"
        ErrorMessage="Es necesario indicar el apellido">
    </asp:RequiredFieldValidator>


    <%--fechaNacimiento--%>
    <div class="form-group">
        <asp:Label ID="LabelFechaNacimiento" runat="server" Text="Fecha de nacimiento:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="TxtFechaNacimiento" runat="server" placeholder="01/01/2026" CssClass="form-control" TextMode="Date"></asp:TextBox>
    </div>


     <%--Validar Fecha de nacimiento--%>
    <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat ="server"
        CssClass="text-danger"
        Display="Dynamic"
        ControlToValidate="TxtFechaNacimiento"
        ErrorMessage="Es necesario indicar la fecha">

    </asp:RequiredFieldValidator>

    <%--correo--%>
    <div class="form-group">
        <asp:Label ID="LblCorreo" runat="server" Text="Correo:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="TxtCorreo" runat="server" placeholder="Correo" CssClass="form-control" TextMode="Email"></asp:TextBox>
    </div>

    <%--Tipo Documento--%>
    <div class="form-group">
        <asp:Label ID="lblTipoDoc" runat="server" Text="Tipo Documento:" CssClass="control-label"></asp:Label>
        <asp:DropDownList ID="ddlTipoDocumento" runat="server" CssClass="form-control">
            <asp:ListItem Text="Seleccione un tipo de documento" Value="0"></asp:ListItem>
            <asp:ListItem Text="Cédula Física" Value="1"></asp:ListItem>
            <asp:ListItem Text="Pasaporte" Value="2"></asp:ListItem>
            <asp:ListItem Text="Cédula Jurídica" Value="3"></asp:ListItem>
        </asp:DropDownList>
    </div>

    <%--Numero Documento--%>
    <div class="form-group">
        <asp:Label ID="LblNumeroDocumento" runat="server" Text="Correo:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="TxtNumeroDocumento" runat="server" placeholder="Numero Documento" CssClass="form-control"></asp:TextBox>
    </div>

    <%--Validar Apellido--%>
    <asp:RequiredFieldValidator ID="rfvNumeroDocumento" runat ="server"
        CssClass="text-danger"
        Display="Dynamic"
        ControlToValidate="TxtNumeroDocumento"
        ErrorMessage="Es necesario indicar el numero de documento">
    </asp:RequiredFieldValidator>

    <div class="py-3">
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
        <div />

           <asp:Label ID="Lblmensaje" runat="server" Text="Mensaje:" CssClass=""></asp:Label>


        <asp:GridView ID="gvPersonas" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Persona" DataSourceID="SqlDataSource1"  >
            <Columns>
                <asp:BoundField DataField="ID_Persona" HeaderText="ID_Persona" InsertVisible="False" ReadOnly="True" SortExpression="ID_Persona" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                <asp:BoundField DataField="Fecha_Nacimiento" HeaderText="Fecha_Nacimiento" SortExpression="Fecha_Nacimiento" />
                <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                <asp:BoundField DataField="Numero_Documento" HeaderText="Numero_Documento" SortExpression="Numero_Documento" />
                <asp:BoundField DataField="Tipo_Documento" HeaderText="Tipo_Documento" SortExpression="Tipo_Documento" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:II-46-PrograIIIConnectionString %>" ProviderName="<%$ ConnectionStrings:II-46-PrograIIIConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Personas] ORDER BY [Apellido]"></asp:SqlDataSource>

    </div>
</asp:Content>
