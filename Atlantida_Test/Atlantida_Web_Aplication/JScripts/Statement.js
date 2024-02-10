$(document).ready(function () {
    fnListarTarjetas();

    $("#slcTarjeta").change(function () {
        var idSeleccionado = parseInt($(this).val());

        actualizarLabels(idSeleccionado);
        fnComprasMensuales(idSeleccionado);
    });
});

var tarjetas = [];

function fnListarTarjetas() {
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
            actualizarLabels(parseInt($("#slcTarjeta").val()));


            //Peticion para las compras mensuales:
            fnComprasMensuales($("#slcTarjeta").val());

        },
        error: function () {
            DesbloquearUI();
            MensajeDeError("Ha ocurrido un Error");
        }
    });
}

function actualizarLabels(idTarjetaSeleccionada) {
    // Buscar la tarjeta correspondiente en el array de tarjetas
    var tarjetaSeleccionada = tarjetas.find(function (tarjeta) {
        return tarjeta.idTarjeta === idTarjetaSeleccionada;
    });

    // Actualizar los labels con los valores de la tarjeta seleccionada
    $("#lblTitular").text('Titular Tarjeta: ' + tarjetaSeleccionada.titular);
    $("#lblTarjeta").text('Número Tarjeta: ' + tarjetaSeleccionada.tarjeta);
    $("#lblSaldo").text('Saldo Actual: $' + tarjetaSeleccionada.saldo);
    $("#lblSaldoDisponible").text('Saldo Disponible: $' + tarjetaSeleccionada.saldoDisponible);
    $("#lblLimiteCrediticio").text('Límite de Crédito: $' + tarjetaSeleccionada.limiteCrediticio);
}

function fnComprasMensuales(idTarjeta) {
    var urlQuerys = $("#urlquerys").val();
    $.ajax({
        url: urlQuerys + 'Transacciones/ListCompras',
        type: "POST",
        dataType: 'JSON',
        contentType: 'application/json',
        dataType: 'json',
        data: JSON.stringify({
            idTarjeta: idTarjeta
        }),
        beforeSend: function () {
            Procesando()
        },
        success: function (data) {
            var oTable = $("#tblComprasMensuales").DataTable();
            oTable.clear();
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var s = '';


                    s += '<tr>';
                    s += '<td>' + data[i].fechaRegistro + '</td>';
                    s += '<td>' + data[i].descripcion + '</td>';
                    s += '<td>' + data[i].monto + '</td>';
                    s += '<tr>';
                    const tr = $(s);
                    oTable.row.add(tr[0]).draw();
                }

                DesbloquearUI();
            }
        },
        error: function () {
            DesbloquearUI();
            MensajeDeError("Ha ocurrido un error al cargar las compras");
        }

    });
}