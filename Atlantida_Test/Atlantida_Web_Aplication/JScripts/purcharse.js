var idSeleccionado = 0;

$(document).ready(function () {
    fnObtenerTarjeta();
    $("#slcTarjeta").change(function () {
        idSeleccionado = parseInt($(this).val());
    });

    $("#btnGuardarCompra").on("click", function () {
        fnGuardarCompra(parseInt($("#slcTarjeta option:selected").val()));
    });




});
var tarjetas = [];

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

            idSeleccionado = parseInt($("#slcTarjeta option:selected").val());

        },
        error: function () {
            DesbloquearUI();
            MensajeDeError("Ha ocurrido un Error");
        }
    });
}

function fnGuardarCompra(idTarjetaSeleccionada) {


    if (fnValidarAgregarCompra()) {
        var tarjetaSeleccionada = tarjetas.find(function (tarjeta) {
            return tarjeta.idTarjeta === idTarjetaSeleccionada;
        });


        if (tarjetas.length > 0) {

            var saldo = (tarjetaSeleccionada.saldo + parseFloat($("#txtMontoCompra").val()))

            if (saldo < tarjetaSeleccionada.limiteCrediticio) {
                var urlInterna = $("#hdnUrlUs").val();
                var urlRedirect = urlInterna + 'Statement/Index';
                var urlCommands = $("#urlcommand").val();
                var compra = JSON.stringify({
                    idTarjeta: parseInt($("#slcTarjeta option:selected").val()),
                    idTipoTransaccion: 1,
                    monto: parseFloat($("#txtMontoCompra").val()),
                    descripcion: $("#txtDescripcionCompra").val()
                });


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
                        if (data.message == "OK") {
                            MensajeDeExito("Éxito", "Compra guardada correctamente", urlRedirect);
                        } else {
                            MensajeDeError("A ocurrido un error al guardar compra");
                        }
                    }, error: function () {
                        DesbloquearUI();
                        MensajeDeError("A ocurrido un error al recuperar la informacion");
                    }
                });



            } else {
                MensajeDeError("Seleccione otra tarjeta o llame a atencion al cliente para aumentar su limite crediticio");
            }
        }
    }

}

