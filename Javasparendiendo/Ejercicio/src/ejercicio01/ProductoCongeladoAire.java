/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio01;

/**
 *
 * @author Anthony
 */
public class ProductoCongeladoAire extends ProductoCongelado {

    private double porcentajeNitrogeno, porcentajeOxigeno, porcentajeDioxCarbono, porcentajeVaporAgua;

    public ProductoCongeladoAire(String fechaCaducidad, String numeroLote, String fechaEnvasado, String paisOrigen, double temperatura) {
        super(fechaCaducidad, numeroLote, fechaEnvasado, paisOrigen, temperatura);
        porcentajeDioxCarbono = 0;
        porcentajeOxigeno = 0;
        porcentajeDioxCarbono = 0;
        porcentajeVaporAgua = 0;
    }

    public double getPorcentajeNitrogeno() {
        return porcentajeNitrogeno;
    }

    public void setPorcentajeNitrogeno(double num) {
        porcentajeNitrogeno = num;
    }

    public double getPorcentajeOxigeno() {
        return porcentajeOxigeno;
    }

    public void setPorcentajeOxigeno(double num) {
        porcentajeOxigeno = num;
    }

    public double getPorcentajeDioxCarbono() {
        return porcentajeDioxCarbono;
    }

    public void setPorcentajeDioxCarbono(double num) {
        porcentajeDioxCarbono = num;
    }

    public double getPorcentajeVaporAgua() {
        return porcentajeVaporAgua;
    }

    public void setPorcentajeVaporAgua(double num) {
        porcentajeVaporAgua = num;
    }

    public void printInformationCongeladoAire() {
        System.out.println("Porcentaje de nitrogeno: " + getPorcentajeNitrogeno() + "%\nPorcentaje de oxigeno: " + getPorcentajeOxigeno() + "%\nPorcentaje de Dioxido de carbono: "
                + getPorcentajeDioxCarbono() + "%\nPorcentaje de vapor de agua: " + getPorcentajeVaporAgua());
        printInfomationProducto();
    }

}
