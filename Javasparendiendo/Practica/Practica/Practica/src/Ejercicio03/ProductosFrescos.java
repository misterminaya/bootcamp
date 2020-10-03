/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicio03;

import java.time.LocalDate;

public class ProductosFrescos extends Producto implements IPrecio{

    private String paisOrigen;

    public ProductosFrescos(LocalDate fechaCaducidad, LocalDate fechaEnvasado, int numeroLote, double precio, String paisOrigen) {
        super(fechaCaducidad, fechaEnvasado, numeroLote, precio);
        this.paisOrigen = paisOrigen;
    }

    public String getPaisOrigen() {
        return paisOrigen;
    }

    public void setPaisOrigen(String paisOrigen) {
        this.paisOrigen = paisOrigen;
    }


        @Override
    public double calcularIGV() {

        return IGV * getPrecio();
    }

    @Override
    public double calcularMontoAPagar() {
        return calcularIGV()+getPrecio();
    }

    /**
     *
     */
    @Override
    public void imprimirMontoAPagar() {
        System.out.println("Monto a pagar es: " + calcularMontoAPagar());
    }

    @Override
    public String toString() {
        return super.toString(); //To change body of generated methods, choose Tools | Templates.
    }

}
