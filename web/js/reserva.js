/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//$(function () {
////
////
////});
////    $("#registro").on("submit", function (event) {
////        event.preventDefault();
////
////        validaCampos();
////
////
////        if (camposCorrectos) {
////            this.submit();
////        } 
////    });
//
//
////
//});

//**************** Funciones General *******************
function comprobarNif(dni) {
    var numero;
    var letr;
    var letra;
    var expresion_regular_dni;
    var msg;

    expresion_regular_dni = /^\d{8}[a-zA-Z]$/;

    if (expresion_regular_dni.test(dni) === true) {
        numero = dni.substr(0, dni.length - 1);
        letr = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letra = letra.substring(numero, numero + 1);
        if (letra !== letr.toUpperCase()) {
            msg = "Dni erroneo, la letra del NIF no se corresponde";
        } else {
            msg = "";
        }
    } else {
        msg = "Dni erroneo, formato no válido";
    }
    return msg;
}
/////////////////////////////////////////////////////////////////////



//**************** Validaciones Pantalla Aula *******************
function validaCamposAulaAdd() {

    var nuevoCod = $("#nuevoCod").val();
    var inputnuevoCod = $("#nuevoCod");

    var nuevaDesc = $("#nuevaDesc").val();
    var inputnuevaDesc = $("#nuevaDesc");


    var compruebanuevoCod = false;
    var compruebanuevaDesc = false;
    var compruebaAulasAdd = false;

    if (nuevoCod !== "") {
        if (isNaN(nuevoCod)) {
            compruebanuevoCod = false;
            inputnuevoCod.removeClass("valid").addClass("invalid");
        } else {
            compruebanuevoCod = true;
        inputInicio.removeClass("invalid").addClass("valid");
        }
    } else {
        compruebanuevoCod = false;
        inputnuevoCod.removeClass("valid").addClass("invalid");
    }

    if (nuevaDesc === "") {
        compruebanuevaDesc = false;
        inputnuevaDesc.removeClass("valid").addClass("invalid");
    } else {
        compruebanuevaDesc = true;
        inputInicio.removeClass("invalid").addClass("valid");
    }

    if (compruebanuevoCod && compruebanuevaDesc) {
        compruebaAulasAdd = true;
    }

    if (compruebaAulasAdd) {
        return true;
    } else {
        return false;
    }
}
/////////////////////////////////////////////////////////////////////
function validaCamposAula() {
    var codAula = $("#codAula").val();
    var inputAula = $("#codAula");

    var descripcion = $("#descripcion").val();
    var inputDescripcion = $("#descripcion");


    var compruebaCodAula = false;
    var compruebaDescripcion = false;
    var compruebaAulas = false;

    if (codAula !== "") {
        if (isNaN(codAula)) {
            compruebaCodAula = false;
            inputAula.removeClass("valid").addClass("invalid");
        } else {
            compruebaCodAula = true;
            inputInicio.removeClass("invalid").addClass("valid");
        }
    } else {
        compruebaCodAula = false;
        inputAula.removeClass("valid").addClass("invalid");
    }

    if (descripcion === "") {
        compruebaDescripcion = false;
        inputDescripcion.removeClass("valid").addClass("invalid");
    } else {
        inputInicio.removeClass("invalid").addClass("valid");
        compruebaDescripcion = true;
    }

    if (compruebaCodAula && compruebaDescripcion) {
        compruebaAulas = true;
    }

    if (compruebaAulas) {
        return true;
    } else {
        return false;
    }
}
/////////////////////////////////////////////////////////////////////



//**************** Validaciones Pantalla Franjas *******************
function validaCamposFranjas() {
    var inicio = $("#inicio").val();
    var inputInicio = $("#inicio");

    var fin = $("#fin").val();
    var inputFin = $("#fin");


    var compruebaInicio = false;
    var compruebaFin = false;
    var compruebaFranjas = false;

    if (inicio !== "") {
        compruebaInicio = true;
        inputInicio.removeClass("invalid").addClass("valid");
    } else {
        compruebaInicio = false;
        inputInicio.removeClass("valid").addClass("invalid");
    }

    if (fin === "") {
        compruebaFin = false;
        inputFin.removeClass("valid").addClass("invalid");
    } else {
        inputInicio.removeClass("invalid").addClass("valid");
        compruebaFin = true;
    }

    if (compruebaInicio && compruebaFin) {
        compruebaFranjas = true;
    }

    if (compruebaFranjas) {
        return true;
    } else {
        return false;
    }
}
/////////////////////////////////////////////////////////////////////


//**************** Validaciones Pantalla Usuarios *******************
function validaCamposGestUsuarios() {
    var nombre = $("#nombre").val();
    var inputNombre = $("#nombre");

    var apellidos = $("#apellidos").val();
    var inputApellidos = $("#apellidos");

    var correo = $("#correo").val();
    var inputCorreo = $("#correo");
    
    var edad = $("#edad").val();
    var inputEdad = $("#edad");

    var compruebaNombre = false;
    var compruebaApellidos = false;
    var compruebaCorreo = false;
    var compruebaEdad = false;
    var compruebaUsuarios = false;

    if (nombre !== "") {
        compruebaNombre = true;
        inputNombre.removeClass("invalid").addClass("valid");
    } else {
        compruebaNombre = false;
        inputNombre.removeClass("valid").addClass("invalid");
    }

    if (apellidos === "") {
        compruebaApellidos = false;
        inputApellidos.removeClass("valid").addClass("invalid");
    } else {
        inputApellidos.removeClass("invalid").addClass("valid");
        compruebaApellidos = true;
    }
    
    if (correo === "") {
        compruebaCorreo = false;
        inputCorreo.removeClass("valid").addClass("invalid");
    } else {
        inputCorreo.removeClass("invalid").addClass("valid");
        compruebaCorreo = true;
    }
    
    if (edad !== "") {
        if (isNaN(edad)) {
            compruebaEdad = false;
            inputEdad.removeClass("valid").addClass("invalid");
        } else {
            compruebaEdad = true;
            inputEdad.removeClass("invalid").addClass("valid");
        }
    } else {
        compruebaEdad = false;
        inputEdad.removeClass("valid").addClass("invalid");
    }

    if (compruebaCorreo && compruebaNombre && compruebaApellidos && compruebaEdad) {
        compruebaUsuarios = true;
    }

    if (compruebaUsuarios) {
        return true;
    } else {
        return false;
    }
}
/////////////////////////////////////////////////////////////////////


//**************** Validaciones Pantalla Registro *******************
function validaCampos() {

    var camposCorrectos = false;
    var camposCorrectoNombre = false;
    var camposCorrectoApe = false;
    var camposCorrectoDNI = false;
    var camposCorrectoEmail = false;
    var camposCorrectoEdad = false;
    var camposCorrectoUsu = false;
    var camposCorrectoPass = false;
    var camposCorrectoPassRep = false;
    var camposCorrectoCap = false;

    var dni = $("#dni").val();
    var nombre = $("#nombre").val();
    var apellidos = $("#apellidos").val();
    var email = $("#email").val();
    var edad = $("#edad").val();
    var usuario = $("#usuario").val();
    var password = $("#password").val();
    var password_rep = $("#password_rep").val();
    var valCaptcha = $("#valCaptcha").val();

    if (nombre === "") {
        $("#val_nombre").text("El campo Nombre es obligatorio");
        camposCorrectoNombre = false;
    } else {
        $("#val_nombre").text("");
        camposCorrectoNombre = true;
    }

    if (apellidos === "") {
        $("#val_apellidos").text("El campo Apellidos es obligatorio");
        camposCorrectoApe = false;
    } else {
        $("#val_apellidos").text("");
        camposCorrectoApe = true;
    }

    if (edad === "") {
        $("#val_edad").text("El campo Edad es obligatorio");
        camposCorrectoEdad = false;
    } else {
        $("#val_edad").text("");
        camposCorrectoEdad = true;
    }

    if (usuario === "") {
        $("#val_usuario").text("El campo Usuario es obligatorio");
        camposCorrectoUsu = false;
    } else {
        $("#val_usuario").text("");
        camposCorrectoUsu = true;
    }

    if (password === "") {
        $("#val_password").text("El campo Contraseña es obligatorio");
        camposCorrectoPass = false;
    } else {
        $("#val_password").text("");
        camposCorrectoPass = true;
    }

    if (password_rep === "") {
        $("#val_password_rep").text("El campo Repetir contraseña es obligatorio");
        camposCorrectoPassRep = false;
    } else {
        $("#val_password_rep").text("");
        camposCorrectoPassRep = true;
    }

    if (valCaptcha === "") {
        $("#val_valCaptcha").text("El campo Captcha es obligatorio");
        camposCorrectoCap = false;
    } else {
        $("#val_valCaptcha").text("");
        camposCorrectoCap = true;
    }

    expresion = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    if (!expresion.test(email)) {
        $("#val_email").text("Inserte un email válido");
        camposCorrectoEmail = false;
    } else {
        $("#val_email").text("");
        camposCorrectoEmail = true;
    }

    if (dni === "") {
        $("#val_dni").text("El campo DNI es obligatorio");
        camposCorrectoDNI = false;
    } else {
        var msgDNI = comprobarNif(dni);
        camposCorrectoDNI = true;
        $("#val_dni").text(msgDNI);
    }

    if (camposCorrectoDNI && camposCorrectoNombre &&
            camposCorrectoApe && camposCorrectoEdad &&
            camposCorrectoEmail && camposCorrectoPass &&
            camposCorrectoPassRep && camposCorrectoUsu)
    {
        camposCorrectos = true;
    }

    if (camposCorrectos) {
        return true;
    } else {
        return false;
    }
}
/////////////////////////////////////////////////////////////////////