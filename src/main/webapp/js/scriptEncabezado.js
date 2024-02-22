function contarP(cadena, secuencia) {
    var index = cadena.indexOf(secuencia); var contador = 0;
    
    while (index !== -1) {
        contador++; index = cadena.indexOf(secuencia, index + secuencia.length);
    }
    return contador;
}
function mostrar(id){
    $("#"+id).removeAttr("hidden");
}
function mostrarVarios(ids=[]){
    ids.map(id => mostrar(id));
}
$(document).ready(function(){
    function establecerBotonBack(){
        var url = window.location.href;
        url = url.substring(url.indexOf("bnnm")+5);
        var csls = contarP(url,"/");
        var urlC = url;
        url = url.replaceAll("/","").replaceAll("#","")
        var retorno = "home";
        // console.log(url+" "+csls);

        var etiqueta = $("#aRegreso");

        if($("#userShow").text() == "Administrador"){ mostrarVarios(["aAdminC","aAdminU"]); }
        else{ mostrar("aDocE"); }

        if(csls <= 1 && url.endsWith("s")){
            $("#accionesDoc").removeAttr("hidden");
            retorno = "admin";
            if(["notas", "asistencias"].includes(url) && $("#userShow").text() != "Administrador"){
                retorno = "docente";
                mostrarVarios(["aNotas","aAsistencias"]);
            }else if(!["notas", "asistencias","usuarios"].includes(url)){
                $("#aRegistro").attr("href","/bnnm/"+url+"/agregar")
                mostrar("aRegistro");
            }else if(url=="usuarios"){
                mostrar("aUsuarioDel");
            }
            etiqueta.removeAttr("hidden");
            // if($("#userShow").text != "Administrador" && ) // docentes, alumnos, notas, asistencias, cursos,
            // retorno = "home/";
        }else if(csls >= 1 && url.includes("s")){
            retorno = urlC.substring(0, urlC.indexOf("/")).replace("/","");
            etiqueta.removeAttr("hidden");
        }
        // console.log("/bnnm/"+retorno);
        etiqueta.attr("href", "/bnnm/"+retorno);
    }
    establecerBotonBack();

    function confirmacionModalDels(){
        $("#modalMostrarDels").modal("show");
    }
    $("#aUsuarioDel").on("click", confirmacionModalDels);
});