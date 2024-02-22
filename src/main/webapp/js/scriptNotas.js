function calcularNF(){
    var nf = "";
    var ids = ["1","2","3","4","5"].map(n => "n"+n);
    var els = ids.map(v => document.getElementById(v));
    
    var notas = els.map(vi => vi.value).slice(0,4);
    console.log(notas);
    if(!notas.includes("")){
        notas = notas.map(n => parseInt(n));
        nf = notas.reduce((acumulador, elemento) => acumulador + elemento, 0) / 4;
    }
    els[4].value=nf;
}