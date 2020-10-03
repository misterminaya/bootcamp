/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio01;


public class ProductoCongeladoAgua extends ProductoCongelado{

    private double gramosSal, litrosAgua;

    public ProductoCongeladoAgua(String fechaCaducidad, String numeroLote, String fechaEnvasado, String paisOrigen, double temperatura) {
        super(fechaCaducidad, numeroLote, fechaEnvasado, paisOrigen, temperatura);
        gramosSal = 0;
        litrosAgua = 0;
    }

    public void setSal(double sal) {
        gramosSal = sal;
    }

    public void setLitrosAgua(double litro) {
        litrosAgua = litro;
    }

    public double calcularSalinidad() {
        double salinidad = gramosSal * litrosAgua;
        return salinidad;
    }

    public double getSal() {
        return gramosSal;
    }

    public double getLitrosAgua() {
        return litrosAgua;
    }

    public void printInformationProductoCongeladoAgua() {
        System.out.println("Salinidad del agua: " + calcularSalinidad());
        printInfomationProducto();
    }
}
