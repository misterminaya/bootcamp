/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicio03;

import java.time.LocalDate;

public class ProductoCongeladoPorAgua extends ProductosCongelados {

    private double salinidadAgua;

    public ProductoCongeladoPorAgua(LocalDate fechaCaducidad, LocalDate fechaEnvasado, int numeroLote, double precio, String paisOrigen, int temperaturaMantenimiento, double salinidadAgua) {
        super(fechaCaducidad, fechaEnvasado, numeroLote, precio, paisOrigen, temperaturaMantenimiento);
        this.salinidadAgua = salinidadAgua;
    }

    public double getSalinidadAgua() {
        return salinidadAgua;
    }

    public void setSalinidadAgua(double salinidadAgua) {
        this.salinidadAgua = salinidadAgua;
    }

    @Override
    public String toString() {
        return super.toString(); //To change body of generated methods, choose Tools | Templates.
    }
    
    

}
