class Feria{
    const puestos

    method puestosUsablesPor(visitante){
        return puestos.filter({puesto => puesto.puedeUsar(visitante)})
    }

    method participoDeLaFeria(visitante){
        return puestos.any({puesto => puesto.utilizoElPuesto(visitante)})
    }

    method cantApadrinadoPor(municipio){
        return puestos.count({puesto => puesto.esApadrinadoPor(municipio)})
    }

    method municipiosApadrinantesDeLosPuestos(){
        return puestos.map({puesto => puesto.municipioApadrinante()}).asSet()
    }

    method promedioRecaudado(){
        return self.municipiosApadrinantesDeLosPuestos().average({puesto => puesto.cantRecaudada()})
    }

    method municipioMenosRecaudador(){
        return self.municipiosApadrinantesDeLosPuestos().min({municipio => municipio.cantRecaudada()})
    }

    method agregarPuesto(puesto){ //para el test
        puestos.add(puesto)
    }
}