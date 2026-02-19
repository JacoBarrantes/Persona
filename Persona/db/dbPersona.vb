Imports System.Data.SqlClient
Imports System.Runtime.Remoting.Messaging

Public Class dbPersona


    Private ReadOnly dbHelper = New DbHelper() 'clase para manejar la conexion y consultas a la base de datos

    Public Function CrearPersona(persona As Models.Persona) As Boolean
        Dim Sql As String = "INSERT INTO Personas(Nombre, Apellido, Fecha_Nacimiento, Correo, Numero_Documento, Tipo_Documento) VALUES(@Nombre, @Apellido, @Fecha_Nacimiento, @Correo, @Numero_Documento, @Tipo_Documento)" &
         "Select scope_Identity();"

        'Conexion a base de datos

        Dim parametros As New List(Of SqlParameter) From {
            New SqlParameter("@Nombre", persona.Nombre),
            New SqlParameter("@Apellido", persona.Apellidos),
            New SqlParameter("@Correo", persona.Correo),
            New SqlParameter("@Fecha_Nacimiento", persona.FechaNacimiento),
            New SqlParameter("@Numero_Documento", persona.NumeroDocumento),
            New SqlParameter("@Tipo_Documento", persona.TipoDocumento)
        }
        Return dbHelper.ExecuteScalar(Sql, parametros) > 0

    End Function


    Public Function EliminarPersona(id As Integer) As Boolean
        Dim Sql As String = "DELETE FROM Personas WHERE Id_Persona = @Id"

        Dim parametros As New List(Of SqlParameter) From {
            New SqlParameter("@Id", id)
        }
        Return dbHelper.ExecuteNonQuery(Sql, parametros) > 0
    End Function
End Class
