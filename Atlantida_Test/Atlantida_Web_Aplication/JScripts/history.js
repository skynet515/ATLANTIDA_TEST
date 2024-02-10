$(document).ready(function () {
    fnListarTarjetas();
    $("#slcTarjeta").change(function () {
        var idSeleccionado = parseInt($(this).val());
        fnTransaccionesMensuales(idSeleccionado);
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
            
            //Peticion para las compras mensuales:
            fnTransaccionesMensuales($("#slcTarjeta").val());

        },
        error: function () {
            DesbloquearUI();
            MensajeDeError("Ha ocurrido un Error");
        }
    });
}





function fnTransaccionesMensuales(idTarjeta) {
    var urlQuerys = $("#urlquerys").val();
    $.ajax({
        url: urlQuerys + 'Transacciones/ListTransacciones',
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
            var oTable = $("#tblTransaccionesMensuales").DataTable();
            oTable.clear();
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var s = '';


                    s += '<tr>';
                    s += '<td>' + data[i].tipo + '</td>';
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