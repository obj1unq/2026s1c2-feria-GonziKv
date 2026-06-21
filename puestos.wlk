class Puesto{

    const utilizadoPor = []

    method puedeUsar(visitante)

    method esUsadoPor(visitante){
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
}

class PuestoInfantil inherits Puesto{

    override method puedeUsar(visitante){
        return visitante.mayorDeEdad()
    }

    override method esUsadoPor(visitante){
        self.validarUso(visitante)
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
        self.validarUso(visitante)
        super(visitante)
        visitante.gastar(costo)
    }
}