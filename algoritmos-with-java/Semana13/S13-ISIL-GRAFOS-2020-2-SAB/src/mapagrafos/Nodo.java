/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapagrafos;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class Nodo {

    private String nombre;
    private List<Enlace> enlaces = null;

    public Nodo(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Enlace> getEnlaces() {
        return enlaces;
    }

    public void setEnlaces(Enlace enlace) {
        if (enlaces == null) {
            enlaces = new ArrayList<>();
        }
        enlaces.add(enlace);
    }

    @Override
    public String toString() {
        return "Nodo{" + "nombre=" + nombre + ", enlaces=" + enlaces + '}';
    }

    
    
}
