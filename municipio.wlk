class Municipio{
    var cantRecaudada = 0

    method cantRecaudada(){
        return cantRecaudada
    }

    method montoExigible(ciudadano){
        return self.montoBruto(ciudadano) - self.montoProrrogable(ciudadano)
    }
    method montoBruto(ciudadano)
    method montoProrrogable(ciudadano)

    method recibirImpuesto(cantidad){
        cantRecaudada += cantidad
    }

}

class MunicipioNormal inherits Municipio{
    override method montoBruto(ciudadano){
        return ciudadano.deuda()
    }

    override method montoProrrogable(ciudadano){
        if (self.edadProrrogable(ciudadano)) {
            return self.montoBruto(ciudadano) * 0.10
        } else {
            return 0
        }
    }

    method edadProrrogable(ciudadano){
        return ciudadano.edad() >= 75
    }
}

class MunicipioRelajado inherits MunicipioNormal{
    override method montoBruto(ciudadano){
        return ciudadano.deuda().min(ciudadano.dinero())
    }
}

class MunicipioHiperRelajado inherits MunicipioRelajado{
    override method montoBruto(ciudadano){
        return super(ciudadano) * 0.80
    }

    override method montoProrrogable(ciudadano){
        return super(ciudadano) * 2
    }

    override method edadProrrogable(ciudadano){
        return ciudadano.edad() >= 60
    }
}