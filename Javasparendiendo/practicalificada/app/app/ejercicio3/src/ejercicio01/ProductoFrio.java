/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio01;


public class ProductoFrio extends Producto {

    private double temperaturaCongelacionRecomendada;

    public ProductoFrio(String fechaCaducidad, String numeroLote, String fechaEnvasado, String paisOrigen, double temperatura) {
        super(fechaCaducidad, numeroLote, fechaEnvasado, paisOrigen);
        temperaturaCongelacionRecomendada = temperatura;
    }

    public double getTemperaturaCongelacionRecomendada() {
        return temperaturaCongelacionRecomendada;
    }

    public void setTemperaturaCongelacionRecomendada(double temperaturaCongelacionRecomendada) {
        this.temperaturaCongelacionRecomendada = temperaturaCongelacionRecomendada;
    }
    
    public void printInformationProductoFrio(){
        System.out.println("Temperatura Recomendada: " + getTemperaturaCongelacionRecomendada());
        printInfomationProducto();
    }

}
