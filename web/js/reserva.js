/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

//$(function () {
//
//
//});
//    $("#registro").on("submit", function (event) {
//        event.preventDefault();
//
//        validaCampos();
//
//
//        if (camposCorrectos) {
//            this.submit();
//        } 
//    });


//
//});

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

    function validaCamposAula(){
        var codAula = $("#codAula").val();
        var descripcion = $("#descripcion").val();
        var compruebaCodAula = false;
        var compruebaDescripcion = false;
        var compruebaAulas = false;
        //TODO ME FALTA POR MIRAR COMO PONGO LOS VALIDADORES EN LAS TABLAS DE GESTION AULAS, GESTION USUARIOS, GESTION FRANJAS Y OLVIDAR CONTRASEÑA
        
        
        if(codAula.isNumeric()){
            compruebaCodAula = true;
        }else{
            compruebaCodAula = false;
        }
        
        if(descripcion === ""){
            compruebaDescripcion = false;
        }else{
            compruebaDescripcion = true;
        }
        
        if(compruebaCodAula && compruebaDescripcion){
            compruebaAulas = true;
        }
        
        if (compruebaAulas) {
            return true;
        } else {
            return false;
        }
    }

    function validaCampos() {

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
            camposCorrectosApe = false;
        } else {
            $("#val_apellidos").text("");
            camposCorrectosApe = true;
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
            camposCorrectosUsu = false;
        } else {
            $("#val_usuario").text("");
            camposCorrectosUsu = true;
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

        if(camposCorrectoDNI && camposCorrectoNombre && 
                camposCorrectosApe && camposCorrectoEdad && 
                camposCorrectoEmail && camposCorrectoPass && 
                camposCorrectoPassRep && camposCorrectosUsu)
        {
            camposCorrectos = true;
        }

        if (camposCorrectos) {
            return true;
        } else {
            return false;
        }
    }