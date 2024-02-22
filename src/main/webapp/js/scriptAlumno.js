function mostrarCursos(id){
    $('#cursosInfo').empty();
    $.ajax({
        url: '/bnnm/alumnos/cursosAlumno',
        data: { id: id },
        success: function(data) {
            data.forEach(function (curso) {
                var li = $('<li>').addClass('list-group-item d-flex justify-content-between align-items-center').text(curso.nombre);
                $('#cursosInfo').append(li);
            });
            $('#modalAlumno').modal('show');
        },
        error: function() {
            alert('Error al obtener la información de Alumno.');
          }
      });
}
function asignarSeccion() {
    $("#seccion").val("No vacantes.");
    var secciones = ["A", "B"];
    $("#CursosParaAlumno").empty();
    $("#listaC").empty();
    buscarSeccion(secciones, 0); // Comenzar con la primera sección
}
function buscarSeccion(secciones, index){
    var ids = ["nivelE","grado","turno"]
    var els = ids.map(id=> document.getElementById(id));

    if (index >= 2 || els.map(v => v.value).includes("")) {
        return;
    }
    if(els[2].value=="T"){ secciones=["C", "D"]; }
    const seccion = secciones[index];
    $.ajax({
        url: '/bnnm/alumnos/obtenerSeccion',
        data: { ne: els[0].value, gr: els[1].value, scc: seccion, tn: els[2].value},
        success: function(enc) {
            if(enc==true){
                $("#seccion").val(seccion);
                $.ajax({
                    url: '/bnnm/alumnos/cursosAlumnoByNet',
                    data: { ne: els[0].value, tn: els[2].value},
                    success: function(cursos) {
                        cursos.forEach(function(curso) {
                            $("#CursosParaAlumno").append("<option value='" + curso.cursoId + "'>" + curso.nombre + "</option>");
                            var li = $('<li>').addClass("list-group-item list-group-item-success").text(curso.nombre);
                            $('#listaC').append(li);
                        });

                        $("#CursosParaAlumno option").each(function() {
                            $(this).prop("selected", true);
                        });
                    },
                    error: function() {
                        alert('Error al buscar los cursos.');
                    }
                });
            } else {
                buscarSeccion(secciones, index + 1); // Llamar recursivamente con la siguiente sección
            }
        },
        error: function() {
            alert('Error al buscar una sección.');
        }
    });
}