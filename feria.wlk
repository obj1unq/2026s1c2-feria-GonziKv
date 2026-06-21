class Feria{
    const puestos

    method puestosUsablesPor(visitante){
        return puestos.filter({puesto => puesto.puedeUsar(visitante)})
    }

    method participoDeLaFeria(visitante){
        return puestos.any({puesto => puesto.utilizoElPuesto(visitante)})
    }
}