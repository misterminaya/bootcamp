/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicio03;

import java.time.LocalDate;

public class ProductosCongelados extends Producto implements IPrecio {

    private String paisOrigen;
    private int temperaturaMantenimiento;

    public ProductosCongelados(LocalDate fechaCaducidad, LocalDate fechaEnvasado, int numeroLote, double precio, String paisOrigen, int temperaturaMantenimiento) {
        super(fechaCaducidad, fechaEnvasado, numeroLote, precio);
        this.paisOrigen = paisOrigen;
        this.temperaturaMantenimiento = temperaturaMantenimiento;
    }

    public String getPaisOrigen() {
        return paisOrigen;
    }

    public void setPaisOrigen(String paisOrigen) {
        this.paisOrigen = paisOrigen;
    }

    public int getTemperaturaMantenimiento() {
        return temperaturaMantenimiento;
    }

    public void setTemperaturaMantenimiento(int temperaturaMantenimiento) {
        this.temperaturaMantenimiento = temperaturaMantenimiento;
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
