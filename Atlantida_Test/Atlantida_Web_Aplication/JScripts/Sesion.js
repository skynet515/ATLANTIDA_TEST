$(document).ready(function () {

    var sesion = [];
    $("#btnIngresarLogin").on("click", function () {
        var urlInterna = $("#hdnUrlUs").val();
        var urlQuerys = $("#urlquerys").val();

        if (fnValidarCamposLoging()) {

            $.ajax({
                url: urlQuerys + "Usuario/Login",
                type: "POST",
                dataType: 'JSON',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify({
                    nombreUsuario: $("#txtUsuario").val(),
                    clave: $("#txtClave").val()
                }),
                beforeSend: function () {
                    Procesando()
                },
                success: function (data) {

                    DesbloquearUI();
                    if (data != null) {
                        sesion = data
                        //Redireccionando al controlador
                        DesbloquearUI();

                        $.ajax({
                            url: urlInterna + "Login/GrabarSesion",
                            type: "POST",
                            dataType: "JSON",
                            contentType: 'application/json',
                            dataType: 'json',
                            data: JSON.stringify({
                                usuario: sesion
                            }),
                            success: function (data) {
                                if (data.request) {
                                    NotificacionSimple("Bienvenido", "Esta cargando su espacio de trabajo", "2000", urlInterna + "Statement/Index");
                                } else {
                                    MensajeDeError("Ha ocurrido un Error");
                                }
                            }
                        });


                    } else {
                        MensajeDeError("Usuario o contraseña Incorrecta");
                    }
                }, error: function () {
                    DesbloquearUI();
                    MensajeDeError("Ha ocurrido un Error");
                }
            });

        }
    })

});