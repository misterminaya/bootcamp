/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicio03;

import java.time.LocalDate;

public class ProductoCongeladoPorAire extends ProductosCongelados {

    private double porcentajeNitrogeno;
    private double porcentajeOxigeno;
    private double porDioxidoCarbono;
    private double porVaporAgua;

    public ProductoCongeladoPorAire(LocalDate fechaCaducidad, LocalDate fechaEnvasado, int numeroLote, double precio, String paisOrigen, int temperaturaMantenimiento, double porcentajeNitrogeno, double porcentajeOxigeno, double porDioxidoCarbono, double porVaporAgua) {
        super(fechaCaducidad, fechaEnvasado, numeroLote, precio, paisOrigen, temperaturaMantenimiento);
        this.porcentajeNitrogeno = porcentajeNitrogeno;
        this.porcentajeOxigeno = porcentajeOxigeno;
        this.porDioxidoCarbono = porDioxidoCarbono;
        this.porVaporAgua = porVaporAgua;
    }

    public double getPorcentajeNitrogeno() {
        return porcentajeNitrogeno;
    }

    public void setPorcentajeNitrogeno(double porcentajeNitrogeno) {
        this.porcentajeNitrogeno = porcentajeNitrogeno;
    }

    public double getPorcentajeOxigeno() {
        return porcentajeOxigeno;
    }

    public void setPorcentajeOxigeno(double porcentajeOxigeno) {
        this.porcentajeOxigeno = porcentajeOxigeno;
    }

    public double getPorDioxidoCarbono() {
        return porDioxidoCarbono;
    }

    public void setPorDioxidoCarbono(double porDioxidoCarbono) {
        this.porDioxidoCarbono = porDioxidoCarbono;
    }

    public double getPorVaporAgua() {
        return porVaporAgua;
    }

    public void setPorVaporAgua(double porVaporAgua) {
        this.porVaporAgua = porVaporAgua;
    }

    @Override
    public String toString() {
        return super.toString(); //To change body of generated methods, choose Tools | Templates.
    }
    
    

}
