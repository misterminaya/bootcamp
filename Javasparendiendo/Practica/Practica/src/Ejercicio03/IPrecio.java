/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicio03;

public interface IPrecio {

    public double IGV = 0.18;
    
    public double calcularIGV();
    public double calcularMontoAPagar();
    public void imprimirMontoAPagar();

}
