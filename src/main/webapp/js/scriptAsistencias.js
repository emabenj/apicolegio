function mostrarDJ(form){
    var rb = document.getElementsByName('rbtnAsist_'+form);
    rb = Array.from(rb).find(rbc => rbc.checked);
    var sel = rb ? rb.value : "";
    var sel = "";
    $("#estado_"+form).val(sel); $("#justificacion_"+form).val("")
    if(sel=="Asistencia"){
        $("#divJust_"+form).addClass("d-none");
    }else{
        
        $("#divJust_"+form).removeClass("d-none");
        $("#justificacion_"+form).focus();
    }
}
function guardarFormularios() {
    // Obtener todos los formularios en la página
    var forms = document.getElementsByTagName("form");
    var asistencias = [];

    for (var i = 0; i < forms.length; i++) {
        var form = forms[i];
        console.log(i+1 + " " +form.asistenciaId.value);
        var asistencia = {
            id: form.asistenciaId.value,
            fecha: form.fecha.value,
            estado: form.estado.value,
            justificacion: form.justificacion.value
        };
        asistencias.push(asistencia);
    }
    $.ajax({
        type: "POST",
        url: "/bnnm/asistencias/guardar-asistencias",
        data: JSON.stringify(asistencias),
        contentType: "application/json",
        success: function (data) {
            console.log("Formularios guardados con éxito.");
            // window.location.href = "asistencias/";
        },
        error: function (xhr, status, error) {
            // Manejar el error en caso de que ocurra
            console.error("Error al guardar los formularios:", error);
        }
    });
    window.location.href = "/bnnm/asistencias/";
}