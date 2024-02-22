function cambiarEstado(etiqueta, usuarioId){
    var alt = String($(etiqueta).find('img').attr('alt'));
    var estado = $("#estado").text();
    if(alt.includes("DELETED")){
        $("#modalConfirmacion").modal('show');
        $("#btnConfirmarU").on("click", event => eliminarUsuario(alt.substring(8,alt.length), event))
    } else if(estado != alt){
        $.ajax({
            url: "/bnnm/usuarios/cambiarEstado",
            data: { id: usuarioId, est: alt},
            success: function(nest) { $("#estado").text(nest); },
            error: function() { 
                alert(`Error al cambiar de estado al usuario.`);
            }
        });
    }
}
function eliminarUsuario(usuarioId){
    var id = parseInt(usuarioId);
    $.ajax({
        url: "/bnnm/eliminarUsuario",
        data: { id: id },
        success: function(confirmacion) {
            if(confirmacion){
                $("#modalConfirmacion").modal('hide');
                setTimeout(function() {
                    window.location.href = "/bnnm/usuarios";
                }, 1000);
            }
        },
        error: function() {
            alert("ERROR AL ACTUALIZAR CONTRASEÑA");
        }
    });
}

$(document).ready(function(){
    var inputCorreo = $("#correo");
    function validarCorreo(){
        var correo = inputCorreo.val();
        $("#alertaCorreoU").prop("hidden", true);
        $("#alertaContrasU").prop("hidden", true);
        if(correo != ""){
            $.ajax({
                url: "/bnnm/buscarCuenta",
                data: { correo: correo },
                success: function(data) {
                    if(data == correo){
                        inputCorreo.prop("readonly",true);
                        $("#alertaCorreoU").prop("hidden", true)
                        // $("#btnRestablecerU").prop("disabled", false);
                    }
                },
                error: function() {                    
                    $("#alertaCorreoU").prop("hidden", false)
                    inputCorreo.prop("readonly",false);
                    // $("#btnRestablecerU").prop("disabled", true);
                }
            });
        }
        
    }
    if(inputCorreo.val() != undefined){
        validarCorreo();
    }
    
    inputCorreo.on("change",validarCorreo);

    var passL = $("input[name='newPass']").map(function() { return this; }).get();
    if (passL.length > 0) {
        function comprobarCamposContra() {
            $("#alertaContrasU").prop("hidden", passL[0].value == passL[1].value);
            $("#btnRestablecerU").prop("disabled", !(passL[0].value == passL[1].value));
            
        }
        passL.forEach(ipt => { ipt.addEventListener("keyup", comprobarCamposContra)});
    }
    
    function restablecerContrasena(){
        var correo=$("#correo").val(); 
        var contra=passL[1].value;
        console.log(contra);
        $.ajax({
            url: "/bnnm/restablecerContrasena",
            data: { correo: correo, newPass: contra},
            success: function(confirmacion) {
                if(confirmacion){
                    setTimeout(function() {
                        window.location.href = "/bnnm/login";
                    }, 1500);
                }
            },
            error: function() {
                alert("ERROR AL ACTUALIZAR CONTRASEÑA");
            }
        });
    }
    $("#btnRestablecerU").on("click", restablecerContrasena);
    function confirmarPassDels(){
        var txtPass = $("#confirmarPass");
        var pass = String(txtPass.val());
        if(pass.trim() != ""){
            $.ajax({
                url: "/bnnm/confirmarPass",
                data: { cpass: pass },
                success: function(confirmacion) {
                    if(confirmacion){
                        // alert("Actualizando página.");
                        $("#modalMostrarDels").modal('hide');
                        setTimeout(function() {
                            window.location.href = "/bnnm/usuarios";
                        }, 2000);
                    }else{
                        txtPass.val("");
                    }
                },
                error: function() {
                    alert("ERROR AL ACTUALIZAR CONTRASEÑA");
                }
            });
        }
    
    }
    $("#btnConfirmarPass").on("click", confirmarPassDels);
});