/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio01;

public class ProductoCongeladoNitrogeno extends ProductoCongelado {

    private String metodoCongelacion;
    private String tiempoExposicion;

    public ProductoCongeladoNitrogeno(String fechaCaducidad, String numeroLote, String fechaEnvasado, String paisOrigen, double temperatura) {
        super(fechaCaducidad, numeroLote, fechaEnvasado, paisOrigen, temperatura);
        metodoCongelacion = "Desconocido";
        tiempoExposicion = "";
    }

    public void setMetodoCongelacion(String metodo) {
        metodoCongelacion = metodo;
    }

    public void setTiempoExposicion(String tiempo) {
        tiempoExposicion = tiempo;
    }

    public String getMetodoCongelacion() {
        return metodoCongelacion;
    }

    public String getTiempoExposicion() {
        return tiempoExposicion;
    }

    public void imprimirDatos() {
        System.out.println("Metodo de congelacion: " + getMetodoCongelacion() + "\nTiempo de exposicion: " + getTiempoExposicion());
        printInfomationProducto();
    }
}
