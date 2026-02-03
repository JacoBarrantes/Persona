Public Class persona
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    'Validacion de fecha desde el codebehind. Tiene prioridad del lado aspx sobre codebehind
    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Dim persona = New Models.Persona()
        If IsDate(TxtFechaNacimiento.Text) = False Then
            Lblmensaje.Text = "La fecha de nacimiento no es valida"
            Return
        End If


        persona.Nombre = txtNombre.Text
        persona.Apellidos = TxtApellido.Text
        persona.FechaNacimiento = TxtFechaNacimiento.Text
        persona.Correo = TxtCorreo.Text
        persona.TipoDocumento = ddlTipoDocumento.SelectedItem.Text
        persona.NumeroDocuemento = TxtNumeroDocumento.Text

        Lblmensaje.Text = persona.Resumen()

    End Sub
End Class