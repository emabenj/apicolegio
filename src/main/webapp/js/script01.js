
function setEventos(evento, listaIDS=[], fn){
    listaIDS.map(id => $("#"+id).on(evento, fn) );
}
function capitalizar(cadena) {
    return cadena.trim().charAt(0).toUpperCase() + cadena.trim().slice(1).toLowerCase();
}
function generarCodigo() {
    var ids=["nombres","apeP","apeM","dni"];
    var els=ids.map(id => document.getElementById(id));

    var codigo = "";

    var error=false;
    for (let v = 0; v < els.length; v++) {
        var element = els[v].value;
        
        let vals = [element.includes(" ") && element.split(" ")[0].length >= 3 && element.split(" ")[1].length >=3 && element.split(" ").length==2,
                    element.trim().length >= 3 && !element.includes(" "),element.trim().length >= 3 && !element.includes(" "),
                     element.length==8];
        let chngs = [element.split(" ").map(n => capitalizar(n)).join(" "),capitalizar(element), capitalizar(element), element];
        
        if(vals[v]){
            els[v].value = chngs[v];
        }else{
            els[v].value= null;
            els[v].focus();
            error=true;
            break;
        }
    }
    if(error!=true){
        var pnom=els[0].value.split(" ")[0]; var snom=els[0].value.split(" ")[1];
        let lts = [snom,els[1].value,els[2].value,pnom,pnom,els[2].value,els[1].value,snom];
        for (let vdn = 0; vdn < 8; vdn++) {
            codigo+=lts[vdn].charAt(vdn/4);
            codigo+=els[3].value.charAt(vdn);
        }
    }
    document.getElementById("codigo").value = codigo.toLowerCase();
}

function cargarGrado(){
    var ids=["nivelE","grado"];
    var els=ids.map(id => document.getElementById(id));
    
    els[1].disabled=true;
    els[1].length=0;

    const opt = document.createElement('option');
        opt.value=""; opt.label= "Seleccionar";
        els[1].appendChild(opt);

    for (let n = 0; n < els[0].childElementCount; n++) {
        if(els[0].children.item(n).value == els[0].value){
            var grados = Array.from({ length: [1,6,5][n] }, (_, index) => index + 1);
            break;
        }
    }
    if (grados!=1){
        els[1].disabled=false;
        for (let ne = 0; ne < grados.length; ne++) {
            var no = document.createElement("option");
            no.value= grados[ne].toString() ; no.textContent= grados[ne].toString()+"°";
            els[1].appendChild(no);
        }
    }
}
function dirigirARestablecimiento(cuentaId){
    var usuarioId = parseInt(cuentaId);
    $.ajax({
        url: "/bnnm/buscarCuenta",
        data: { id: usuarioId },
        success: function(correo) {
            window.location.href = "/bnnm/restablecer-cuenta?correo=" + correo;
        },
        error: function() { 
            alert("No hay una cuenta asignada a este Docente.");
        }
    });
    // console.log(correo)
    // alert(correo);
    // window.location.href = "/restablecer-cuenta?correo=" + correo;
    $('#modalDocente').modal('hide');
}
function mostrarInfo(codD){
    $.ajax({
        url: '/bnnm/docentes/informacionDocente',
        data: { cod: codD },
        success: function(data) {
            const ids = ["nombresD","apellidoPD","apellidoMD","dniD","correoD","direccionD","celularD","fRegistroD"];
            const info = [data.nombres,data.apellidoP,data.apellidoM,data.dni,data.correo,data.direccion,data.celular,data.fRegistro];
            ids.forEach((id, index) => document.getElementById(id).innerText = info[index]);

            var sdoc = "profesor";
            if(data.sexo=="F"){sdoc+="a";}
            
            document.getElementById("imgD").src="/bnnm/imgs/"+sdoc+".png";
            // ESTABLECER FUNCION AL BOTON
            $("#cambiarClaveL").on("click", event => dirigirARestablecimiento(data.cuentaId, event));

            $('#modalDocente').modal('show');
        },
        error: function() {
            alert('Error al obtener la información del docente.');
          }
    });
}
function mostrarG(){
    var gt=document.getElementById("gradoT");
    var gp=document.getElementById("grado");
    if(gt.value!=""){
        cargarGrado();
        gp.selectedIndex=gt.value;
        gt.value="";
    }
}

$(document).ready(function(){
    function seleccionarRBTN(){
        var txt = String($("#estadoE").val());
        if(txt != "") {
            var index = ["ACTIVE","INACTIVE","BLOCKED"].indexOf(txt)+1;
            $(`#option${index}Editar`).prop("checked", true);
            $(`.optionEditar${index}`).addClass("active");
        }
    }
    seleccionarRBTN()
    function editarEstado(){
        var rbN = document.getElementsByName('options');
        rbN = Array.from(rbN).find(rbc1 => rbc1.checked);
        var estado = rbN ? rbN.value : "";
        $("#estadoE").val(estado);
        console.log(estado);
    }
    setEventos("change",['option1Editar', 'option2Editar', 'option3Editar'], editarEstado);
});
