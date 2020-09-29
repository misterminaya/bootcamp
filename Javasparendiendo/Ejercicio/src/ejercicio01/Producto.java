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
public class Producto {

    private String fechaCaducidad;
    private String numeroLote;
    private String fechaEnvasado;
    private String paisOrigen;

    public Producto(String fechaCaducidad, String numeroLote, String fechaEnvasado, String paisOrigen) {
        this.fechaCaducidad = fechaCaducidad;
        this.numeroLote = numeroLote;
        this.fechaEnvasado = fechaEnvasado;
        this.paisOrigen = paisOrigen;
    }

    public String getFechaCaducidad() {
        return fechaCaducidad;
    }

    public void setFechaCaducidad(String fechaCaducidad) {
        this.fechaCaducidad = fechaCaducidad;
    }

    public String getNumeroLote() {
        return numeroLote;
    }

    public void setNumeroLote(String numeroLote) {
        this.numeroLote = numeroLote;
    }

    public String getFechaEnvasado() {
        return fechaEnvasado;
    }

    public void setFechaEnvasado(String fechaEnvasado) {
        this.fechaEnvasado = fechaEnvasado;
    }

    public String getPaisOrigen() {
        return paisOrigen;
    }

    public void setPaisOrigen(String paisOrigen) {
        this.paisOrigen = paisOrigen;
    }
    
    public void printInfomationProducto(){
        System.out.println("Fecha Caducidad: " + getFechaCaducidad() + "\nNumero de Lote: " + getNumeroLote() + "\nFecha de Envasado: " + getFechaEnvasado() + "\nPais de Origen: " + getPaisOrigen()+ "\n");
    }

}
