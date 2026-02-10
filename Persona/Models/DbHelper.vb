Imports System.Data.SqlClient

Public Class DbHelper
    Private ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("II-46-PrograIIIConnectionString").ConnectionString

    Public Function getconexion() As SqlConnection
        Return New SqlConnection(connectionString)
    End Function

    Public Function CrearPersona(persona As Models.Persona) As Integer
        Dim Sql As String = "INSERT INTO Personas(Nombre, Apellido, Fecha_Nacimiento, Correo, Numero_Documento, Tipo_Documento) 
VALUES(@Nombre, @Apellido, @Fecha_Nacimiento, @Correo, @Numero_Documento, @Tipo_Documento)" &
         "Select scope_Identity();"


        Using conn As SqlConnection = getconexion()
            Using cmd As New SqlCommand(Sql, conn)
                conn.Open()
                cmd.Parameters.AddWithValue("@Nombre", persona.Nombre)
                cmd.Parameters.AddWithValue("@Apellido", persona.Apellidos)
                cmd.Parameters.AddWithValue("@correo", persona.Correo)
                cmd.Parameters.AddWithValue("@Fecha_Nacimiento", persona.FechaNacimiento)
                cmd.Parameters.AddWithValue("@Numero_Documento", persona.NumeroDocumento)
                cmd.Parameters.AddWithValue("@Tipo_Documento", persona.TipoDocumento)

                ' Return cmd.ExecuteNonQuery() Devolver la cantidad de lineas insertada
                Return Convert.ToInt32(cmd.ExecuteScalar())
            End Using
        End Using

        Return 0
    End Function

End Class
