/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapagrafos;

/**
 *
 * @author User
 */
public class Enlace {
 
    private Nodo origen;
    private Nodo destino;
    private Double distancia;

    public Enlace(Nodo origen, Nodo destino, Double distancia) {
        this.origen = origen;
        this.destino = destino;
        this.distancia = distancia;
    }

    public Nodo getOrigen() {
        return origen;
    }

    public void setOrigen(Nodo origen) {
        this.origen = origen;
    }

    public Nodo getDestino() {
        return destino;
    }

    public void setDestino(Nodo destino) {
        this.destino = destino;
    }

    public Double getDistancia() {
        return distancia;
    }

    public void setDistancia(Double distancia) {
        this.distancia = distancia;
    }

    @Override
    public String toString() {
        return "\n Enlace{" + "origen=" + origen.getNombre() + ", destino=" + destino.getNombre() + ", distancia=" + distancia + '}';
    }
    
    
    
    
    
}
