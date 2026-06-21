class Puesto{
    const utilizadoPor = []
    const municipioApadrinante

    method puedeUsar(visitante)

    method esUsadoPor(visitante){
        self.validarUso(visitante)
        utilizadoPor.add(visitante)
    }
    method validarUso(visitante){
        if (not self.puedeUsar(visitante)){
            self.error("No puede ser utilizado por " + visitante)
        }
    }
    method genteQueUtilizo(){
        return utilizadoPor
    }
    
    method utilizoElPuesto(visitante){
        return utilizadoPor.contains(visitante)
    }

    method municipioApadrinante(){
        return municipioApadrinante
    }

    method esApadrinadoPor(municipio){
        return municipio == municipioApadrinante
    }

    method cantRecaudada(){
        return municipioApadrinante.cantRecaudada()
    }

}

class PuestoInfantil inherits Puesto{

    override method puedeUsar(visitante){
        return visitante.menorDeEdad()
    }

    override method esUsadoPor(visitante){
        super(visitante)
        visitante.ganar(10)
    }
}

class PuestoComercial inherits Puesto{
    const costo

    override method puedeUsar(visitante){
        return visitante.puedePagar(costo)
    }

    override method esUsadoPor(visitante){
        super(visitante)
        visitante.gastar(costo)
    }
}

class PuestoImpositivo inherits Puesto{

    override method puedeUsar(visitante){
        return visitante.resideEn(municipioApadrinante) and
               visitante.poseeDeuda() and
               visitante.puedePagarSuDeuda()
    }
    override method esUsadoPor(visitante){
        super(visitante)
        visitante.pagarMontoExigido()
    }
}