/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicio03;

import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;

public class TestHerencia3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ArrayList<IPrecio> all = new ArrayList<>();
        ArrayList<Producto> al = new ArrayList<>();
        ProductosFrescos tomate = new ProductosFrescos(LocalDate.of(2010, Month.MARCH, 30), LocalDate.of(2010, Month.JANUARY, 30), 12, 18.0, "Peru");
        all.add(tomate);
        al.add(tomate);
        ProductosFrescos manzana = new ProductosFrescos(LocalDate.of(2019, Month.MARCH, 31), LocalDate.of(2019, Month.JANUARY, 19), 12, 18.0, "Colombia");
        all.add(manzana);
        al.add(manzana);
        ProductosRefrigerados leche = new ProductosRefrigerados(LocalDate.of(2010, Month.MARCH, 30), LocalDate.of(2019, Month.JANUARY, 19), 12, 32.5, "A", "Peru", 37);
        all.add(leche);
        al.add(leche);
        ProductosRefrigerados jugo = new ProductosRefrigerados(LocalDate.of(2010, Month.MARCH, 30), LocalDate.of(2019, Month.JANUARY, 19), 12, 20.5, "A", "Egipto", 37);
        all.add(jugo);
        al.add(jugo);
        ProductosRefrigerados queso = new ProductosRefrigerados(LocalDate.of(2010, Month.MARCH, 30), LocalDate.of(2019, Month.JANUARY, 19), 12, 49.3, "A", "Argentina", 37);
        all.add(queso);
        al.add(queso);
        System.out.println("Tomate: "+tomate);
        System.out.println("Manzana: "+manzana);
        System.out.println("Leche: "+leche);
        System.out.println("Jugo"+jugo);
        System.out.println("Queso: "+queso);
        System.out.println("-----------------------------------");
        for (IPrecio p : all) {
            System.out.println("Los precios son: "+ p.calcularMontoAPagar());
        }
        System.out.println("----------------------------------");
        for (Producto a : al) {
            System.out.println("Precios: "+a.getPrecio());;
        }
    }

}
