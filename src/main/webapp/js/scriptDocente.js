function setEventos(evento, listaIDS=[], fn){
    listaIDS.map(id => $("#"+id).on(evento, fn) );
}
function insertarDatosEnTabla(datos) {
    $('#tablaD tbody').empty();  
    datos.forEach(function (docente) {
        var newRow = $('<tr>');
        var datosDocente = [docente.docente_cod,docente.nombres, docente.apellidoP +" " + docente.apellidoM, docente.celular, docente.fRegistro, docente.curso.nombre];
        datosDocente.forEach((dt) => newRow.append($('<td>').text(dt)) );
        
        var acciones = $('<td>');
        var btn = $('<button>').addClass('btn btn-primary btn-sm').text('Ver').attr('onclick', `mostrarInfo('${docente.docente_cod}')`);
        var editarA = $('<a>').attr('href', `/bnnm/docentes/editar/${docente.docente_cod}`).addClass('text-success').text('Editar');
        var eliminarA = $('<a>').attr('href', `/bnnm/docentes/eliminar/${docente.docente_cod}`).addClass('text-danger').text('Eliminar');
        acciones.append(btn, ' | ', editarA, ' | ', eliminarA);

        newRow.append(acciones);

        $('#tablaD tbody').append(newRow);
    });
}
function capitalizar(cadena) {
    return cadena.trim().charAt(0).toUpperCase() + cadena.trim().slice(1).toLowerCase();
}
$(document).ready(function(){
    function cargarCursos(selectID,opt){
        var rbN = document.getElementsByName('rbtnNE'); var rbT = document.getElementsByName('rbtnT');
        rbN = Array.from(rbN).find(rbc1 => rbc1.checked); rbT = Array.from(rbT).find(rbc2 => rbc2.checked);
        var nv = rbN ? rbN.value : ""; var tn = rbT ? rbT.value : ""; 
        
        if(nv != "" && tn != "" ){
            $.ajax({
                url: '/bnnm/cursos/filtrarCursos',
                data: { nivelE : nv, turno : tn},
                success: function(data) {
                    $("#"+selectID).empty();
                    $("#"+selectID).append("<option value='0'>" + opt + "</option>");
                    if (data.length != 0) {
                        data.forEach(function(curso) {
                            $("#"+selectID).append("<option value='" + curso.cursoId + "'>" + curso.nombre + "</option>");
                        });
                    } else {
                        if (confirm(`No hay cursos registrados para ${nv}. ¿Deseas registrar uno ahora?`)) {
                            setTimeout(function() { window.location.href = "/bnnm/cursos/agregar"; }, 1000);
                        }
                    }
                },
                error: function() {
                    alert(`Error al obtener los cursos de ${nv} del Turno ${tn}`);
                }
            });
        }
        
    }
    $("#rb1M").on('click', event => cargarCursos("cursosM","Seleccionar", event));// REGISTRAR
    $("#rb2M").on('click', event => cargarCursos("cursosM","Seleccionar", event));
    $("#rbTMM").on('click', event => cargarCursos("cursosM","Seleccionar", event));
    $("#rbTTM").on('click', event => cargarCursos("cursosM","Seleccionar", event));

    $("#rb1L").on('click', event => cargarCursos("cursosD","Todos los cursos", event));// LISTAR
    $("#rb2L").on('click', event => cargarCursos("cursosD","Todos los cursos", event));
    $("#rbTML").on('click', event => cargarCursos("cursosD","Todos los cursos", event));
    $("#rbTTL").on('click', event => cargarCursos("cursosD","Todos los cursos", event));
    
    function establecerInput(){
        var ids = ["filtro", "buscador","rbtns", "ffch"];
        var els = ids.map(id => document.getElementById(id));
    
        //REINICIAR VALORES
        els[1].value=null;
        ["rbML","rbFL"].map(id => document.getElementById(id)).map(rb=> rb.checked=false);
        document.getElementById("fechaRF").value=null;
        
        els[2].classList.add("d-none");els[3].classList.add("d-none");
    
        if (els[0].value != 0 && els[0].value != 1){
            els[1].type="hidden";
            els[els[0].value].classList.remove("d-none");
        }else{ els[1].type="search";}
    }
    $("#filtro").on('change', establecerInput);
    
    function filtrar(){
        // cursoId, nombres, apellidos, sexo y fecha de registro
        var rb = document.getElementsByName('rbtnsexo');
        rb = Array.from(rb).find(rbc => rbc.checked);
        var sexo = rb ? rb.value : "";        
        
        var ids = ["cursosD","buscador","fechaRF","filtro"];
        var els = ids.map(id => document.getElementById(id).value);
        var nmap = ["",""];
        if (els[3] < 2){ nmap[els[3]] = els[1]; }
    
        var valores = [els[0],nmap[0],nmap[1],sexo,els[2]]
        // bivel educativo y turno
        var rbN = document.getElementsByName('rbtnNE'); var rbT = document.getElementsByName('rbtnT');
        rbN = Array.from(rbN).find(rbc1 => rbc1.checked); rbT = Array.from(rbT).find(rbc2 => rbc2.checked);
        var nivelE = rbN ? rbN.value : ""; var turno = rbT ? rbT.value : "";
    
        $.ajax({
            url: '/bnnm/docentes/filtrarDocente',
            data: { ci: valores[0], nms:valores[1], aps:valores[2], sx:valores[3], fr:valores[4], nv:nivelE, tn:turno },
            success: function(data) {
                insertarDatosEnTabla(data);
            },
            error: function() {
                alert('Error al obtener la información del docente.');
              }
        });
    }
    setEventos("click", ["rbML","rbFL"], filtrar); setEventos("keyup", ["buscador"], filtrar);
    setEventos("change", ["fechaRF"], filtrar);

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
        $("#codigo").val(codigo.toLowerCase());
    }
    setEventos("change",["nombres","apeP","apeM","dni"],generarCodigo)
    
});