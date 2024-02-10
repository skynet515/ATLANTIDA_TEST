$(document).ready(function () {
    fnObtenerTarjeta();

    $("#btnGuardarPago").on("click", function () {
        var urlInterna = $("#hdnUrlUs").val();
        var urlCommands = $("#urlcommand").val();
        var compra = JSON.stringify({
            idTarjeta: parseInt($("#slcTarjeta option:selected").val()),
            idTipoTransaccion: 2,
            monto: parseFloat($("#txtMontoPago").val()),
            descripcion: $("#txtDescripcionPago").val()
        });

        if (fnValidarAgregarPago()) {
            $.ajax({
                url: urlCommands + 'Transaction/Transaction',
                type: "POST",
                dataType: 'JSON',
                contentType: 'application/json',
                dataType: 'json',
                data: compra,
                beforeSend: function () {
                    Procesando()
                },
                success: function (data) {
                    DesbloquearUI();

                    var urlRedireccion = urlInterna.endsWith('/') ? urlInterna : urlInterna + '/';
                    urlRedireccion += 'Statement/Index';
                    console.log('URL de redirección:', urlRedireccion);

                    if (data.message == "OK") {
                        MensajeDeExito("Éxito", "Pago guardado correctamente", urlRedireccion);
                    } else {
                        MensajeDeError("A ocurrido un error al guardar compra");
                    }
                }, error: function () {
                    DesbloquearUI();
                    MensajeDeError("A ocurrido un error al recuperar la informacion");
                }
            });
        }

        
    });
});


function fnObtenerTarjeta() {
    var urlQuerys = $("#urlquerys").val();
    var idPersona = $("#idPersona").val();

    $.ajax({
        url: urlQuerys + 'TitularTarjeta/Titular',
        type: "POST",
        dataType: 'JSON',
        contentType: 'application/json',
        dataType: 'json',
        data: JSON.stringify({
            idPersona: idPersona
        }),
        beforeSend: function () {
            Procesando()
        },
        success: function (data) {
            DesbloquearUI();
            tarjetas = data;

            $("#slcTarjeta").empty();

            $.each(data, function (key, value) {
                $("#slcTarjeta").select2().append('<option selected value="' + value.idTarjeta + '">' + value.titular + ' ' + value.tarjeta + '</option>');
            });

        },
        error: function () {
            DesbloquearUI();
            MensajeDeError("Ha ocurrido un Error");
        }
    });
}

