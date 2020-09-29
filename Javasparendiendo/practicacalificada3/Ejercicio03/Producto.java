/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicio03;

import java.time.LocalDate;

public class Producto {

    private LocalDate fechaCaducidad;
    private LocalDate fechaEnvasado;
    private int numeroLote;
    private double precio;

    public Producto(LocalDate fechaCaducidad, LocalDate fechaEnvasado, int numeroLote, double precio) {
        this.fechaCaducidad = fechaCaducidad;
        this.fechaEnvasado = fechaEnvasado;
        this.numeroLote = numeroLote;
        this.precio = precio;
    }

    public LocalDate getFechaCaducidad() {
        return fechaCaducidad;
    }

    public void setFechaCaducidad(LocalDate fechaCaducidad) {
        this.fechaCaducidad = fechaCaducidad;
    }

    public LocalDate getFechaEnvasado() {
        return fechaEnvasado;
    }

    public void setFechaEnvasado(LocalDate fechaEnvasado) {
        this.fechaEnvasado = fechaEnvasado;
    }

    public int getNumeroLote() {
        return numeroLote;
    }

    public void setNumeroLote(int numeroLote) {
        this.numeroLote = numeroLote;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return ""+getFechaCaducidad() + getFechaEnvasado() + getNumeroLote() + getPrecio();
    }

}
