class Visitante{
    var property edad
    var dinero
    var deuda
    var property lugarResidencia

    method edad(){
        return edad
    }

    method dinero(){
        return dinero
    }

    method menorDeEdad(){
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

    method resideEn(lugar){
        return lugar == lugarResidencia
    }

    method deuda(){
        return deuda
    }

    method poseeDeuda(){
        return deuda > 0
    }
    method puedePagarSuDeuda(){
        return dinero >= self.montoExigido()
    }

    method pagarMontoExigido(){
        const totalAPagar = self.montoExigido()
        lugarResidencia.recibirImpuesto(totalAPagar)
        dinero -= totalAPagar
        deuda -= totalAPagar
    }

    method montoExigido(){
        return lugarResidencia.montoExigible(self)
    }
}