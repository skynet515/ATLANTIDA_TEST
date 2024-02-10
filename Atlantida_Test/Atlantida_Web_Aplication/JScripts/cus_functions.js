$(document).ready(function () {



    //Quitar bordes rojos

    $("#txtUsuario").on('input', function () {
        $("#txtUsuario").removeClass("border-danger");
        $("#val-cons-nombreUsuario").attr("hidden", true);
    });

    $("#txtClave").on('input', function () {
        $("#txtClave").removeClass("border-danger");
        $("#val-cons-clave").attr("hidden", true);
    });

    //--Pagos

    //Descripcion
    $("#txtDescripcionPago").on('input', function () {
        $("#txtDescripcionPago").removeClass("border-danger");
        $("#val-cons-txtDescripcionPago").attr("hidden", true);
    });

    //Monto
    $("#txtMontoPago").on('input', function () {
        $("#txtMontoPago").removeClass("border-danger");
        $("#val-cons-txtMontoPago").attr("hidden", true);
    });

    //--Compras

    $("#txtDescripcionCompra").on('input', function () {
        $("#txtDescripcionCompra").removeClass("border-danger");
        $("#val-cons-txtDescripcionCompra").attr("hidden", true);
    });

    //Monto
    $("#txtMontoCompra").on('input', function () {
        $("#txtMontoCompra").removeClass("border-danger");
        $("#val-cons-txtMontoCompra").attr("hidden", true);
    });

});

function fnValidarCamposLoging() {
    var usuario = $("#txtUsuario").val().length > 0;
    var clave = $("#txtClave").val().length > 0;

    if (!usuario) {
        $("#txtUsuario").addClass("border-danger").focus();
        $("#val-cons-nombreUsuario").removeAttr("hidden");
    }

    if (!clave) {
        $("#txtClave").addClass("border-danger").focus();
        $("#val-cons-clave").removeAttr("hidden");
    }

    return usuario && clave;
}


function fnValidarAgregarPago() {
    var descripcion = $("#txtDescripcionPago").val().length > 0;
    var monto = $("#txtMontoPago").val().length > 0;

    if (!descripcion) {
        $("#txtDescripcionPago").addClass("border-danger").focus();
        $("#val-cons-txtDescripcionPago").removeAttr("hidden");
    }

    if (!monto) {
        $("#txtMontoPago").addClass("border-danger").focus();
        $("#val-cons-txtMontoPago").removeAttr("hidden");
    }

    return descripcion && monto;
}


function fnValidarAgregarCompra() {
    var descripcion = $("#txtDescripcionCompra").val().length > 0;
    var monto = $("#txtMontoCompra").val().length > 0;

    if (!descripcion) {
        $("#txtDescripcionCompra").addClass("border-danger").focus();
        $("#val-cons-txtDescripcionCompra").removeAttr("hidden");
    }

    if (!monto) {
        $("#txtMontoCompra").addClass("border-danger").focus();
        $("#val-cons-txtMontoCompra").removeAttr("hidden");
    }

    return descripcion && monto;
}



