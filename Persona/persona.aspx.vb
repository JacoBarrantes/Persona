Imports Persona.Utils

Public Class persona
    Inherits System.Web.UI.Page

    Private dbPersona As New dbPersona()

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

        Dim result As Integer = dbPersona.CrearPersona(persona)

        If result Then
            gvPersonas.DataBind()
            SwalUtils.ShowSwal(Me, "Persona creada", $"la persona {persona.Nombre} {persona.Apellidos} ha sido creada correctamente.", "success")
        Else
            SwalUtils.ShowSwalError(Me, "Persona no creada", $"Por favor revise los datos.", "Error")
        End If
    End Sub

    Protected Sub gvPersonas_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim ID As Integer = Convert.ToInt32(gvPersonas.DataKeys(e.RowIndex).Value)
        Dim result As Integer = dbPersona.EliminarPersona(ID)

        If result Then
            SwalUtils.ShowSwal(Me, "Persona eliminada", "La persona ha sido eliminada correctamente")

        Else
            SwalUtils.ShowSwal(Me, "Error al eliminar", "La persona no ha sido eliminada, por favor revise los datos", "error")

        End If
        gvPersonas.DataBind()
        e.Cancel = True

    End Sub

    Protected Sub gvPersonas_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)

    End Sub

    Protected Sub gvPersonas_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim persona As New Models.Persona()
        persona.Nombre = CType(gvPersonas.Rows(e.RowIndex).FindControl("txtNombreEdit"), TextBox).Text
        SwalUtils.ShowSwal(Me, persona.Nombre, "", "success")
        gvPersonas.DataBind()
        gvPersonas.EditIndex = -1


    End Sub

    Protected Sub gvPersonas_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gvPersonas.EditIndex = e.NewEditIndex
        txtNombre.Text = CType(gvPersonas.Rows(e.NewEditIndex).FindControl("txtNombreEdit"), TextBox).Text
        gvPersonas.DataBind()

    End Sub
End Class