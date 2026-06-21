class Visitante{
    const edad
    var dinero
    method edad(){
        return edad
    }
    method dinero(){
        return dinero
    }
    method mayorDeEdad(){
        return edad < 18
    }
    method puedePagar(cant){
        return dinero >= cant
    }
    method gastar(cant){
        dinero -= cant
    }
    method ganar(cant){
        dinero += cant
    }
}