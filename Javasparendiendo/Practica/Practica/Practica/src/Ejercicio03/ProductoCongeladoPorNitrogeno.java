/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicio03;

import java.time.LocalDate;


public class ProductoCongeladoPorNitrogeno extends ProductosCongelados {

    private String metodoCongelacion;
    private int tiempoExposicionNitrogeno;

    public ProductoCongeladoPorNitrogeno(LocalDate fechaCaducidad, LocalDate fechaEnvasado, int numeroLote, double precio, String paisOrigen, int temperaturaMantenimiento, String metodoCongelacion, int tiempoExposicionNitrogeno) {
        super(fechaCaducidad, fechaEnvasado, numeroLote, precio, paisOrigen, temperaturaMantenimiento);
        this.metodoCongelacion = metodoCongelacion;
        this.tiempoExposicionNitrogeno = tiempoExposicionNitrogeno;
    }

    public String getMetodoCongelacion() {
        return metodoCongelacion;
    }

    public void setMetodoCongelacion(String metodoCongelacion) {
        this.metodoCongelacion = metodoCongelacion;
    }

    public int getTiempoExposicionNitrogeno() {
        return tiempoExposicionNitrogeno;
    }

    public void setTiempoExposicionNitrogeno(int tiempoExposicionNitrogeno) {
        this.tiempoExposicionNitrogeno = tiempoExposicionNitrogeno;
    }

    @Override
    public String toString() {
        return super.toString(); //To change body of generated methods, choose Tools | Templates.
    }

}
