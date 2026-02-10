Imports Persona.Utils

Public Class persona
    Inherits System.Web.UI.Page

    Private dbHelper As New DbHelper()

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
        persona.TipoDocumento = ddlTipoDocumento.SelectedItem.Value
        persona.NumeroDocumento = TxtNumeroDocumento.Text

        'blmensaje.Text = persona.Resumen()

        Dim ID As Integer = dbHelper.CrearPersona(persona)

        If ID > 0 Then
            Lblmensaje.Text = $"Persona creada con ID: {ID}"
            Lblmensaje.CssClass = "Alert alert-success"
            gvPersonas.DataBind()
            SwalUtils.ShowSwalError(Me, "Persona creada", $"la persona {persona.Nombre} {persona.Apellidos} ha sido creada correctamente.", "success")
        Else
            Lblmensaje.Text = "Error al crear la persona"
            Lblmensaje.CssClass = "Alert alert-danger"
        End If



    End Sub
End Class