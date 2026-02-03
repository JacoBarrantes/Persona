<%@ Page Title="Persona" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="persona.aspx.vb" Inherits="Persona.persona" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%--nombre--%>
    <div class="form-group">
        <asp:Label ID="lblNombre" runat="server" Text="Nombre Completo:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server" Text="Jacob" placeholder="Nombre Completo" CssClass="form-control"></asp:TextBox>
    </div>
    <%--apellido--%>
    <div class="form-group">
        <asp:Label ID="LabelApellido" runat="server" Text="Apellido:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="TxtApellido" runat="server" placeholder="Nombre Completo" CssClass="form-control"></asp:TextBox>
    </div>
    <%--fechaNacimiento--%>
    <div class="form-group">
        <asp:Label ID="LabelFechaNacimiento" runat="server" Text="Fecha de nacimiento:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="TxtFechaNacimiento" runat="server" placeholder="01/01/2026" CssClass="form-control" TextMode="Date"></asp:TextBox>
    </div>


     <%--Validar Fecha de nacimiento--%>
    <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat ="server"
        CssClass="text-danger"
        controlvalidate="TxtFechaNacimiento"
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
            <asp:ListItem Text="Cédula Jurídica" Value="0"></asp:ListItem>
            <asp:ListItem Text="Cédula Física" Value="1"></asp:ListItem>
            <asp:ListItem Text="Pasaporte" Value="2"></asp:ListItem>
        </asp:DropDownList>
    </div>

    <%--Numero Documento--%>
    <div class="form-group">
        <asp:Label ID="LblNumeroDocumento" runat="server" Text="Correo:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="TxtNumeroDocumento" runat="server" placeholder="Numero Documento" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="py-3">
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
        <div />

           <asp:Label ID="Lblmensaje" runat="server" Text="Mensaje:" CssClass=""></asp:Label>
</asp:Content>
