/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio01;

import java.util.Scanner;


public class testHerencia3 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int elige = 0;
        ProductoFresco tomate = new ProductoFresco("30/04/2015", "L1021015", "20/04/2015", "Panamá");
        ProductoFresco manzana = new ProductoFresco("03/05/2015", "L1022015", "20/04/2015", "EEUU");
        ProductoRefrigerado leche = new ProductoRefrigerado("10/05/2015", "L1118015", "24/04/2015", "España", "C#12083");
        ProductoRefrigerado jugo = new ProductoRefrigerado("14/05/2015", "L0912015", "20/04/2015", "Alemania", "C#56785");
        ProductoRefrigerado queso = new ProductoRefrigerado("14/05/2015", "L1112015", "02/04/2015", "Panamá", "C#67890");
        ProductoCongeladoAgua pescado = new ProductoCongeladoAgua("14/7/2015", "L2032015", "10/04/2015", "Panamá", -2.0);
        pescado.setLitrosAgua(5);
        pescado.setSal(283.5);
        ProductoCongeladoAgua cangrejo = new ProductoCongeladoAgua("15/8/2015", "L1023015", "11/04/2015", "Panamá", -2.0);
        cangrejo.setLitrosAgua(3);
        cangrejo.setSal(170.1);
        ProductoCongeladoAgua mariscos = new ProductoCongeladoAgua("15/6/2015", "L2012015", "11/04/2015", "Costa Rica", -1.8);
        mariscos.setLitrosAgua(5);
        mariscos.setSal(170.1);
        ProductoCongeladoAgua pulpo = new ProductoCongeladoAgua("15/6/2015", "L2309015", "16/05/2015", "Colombia", -2.0);
        pulpo.setLitrosAgua(2);
        pulpo.setSal(113.4);
        ProductoCongeladoNitrogeno cordero = new ProductoCongeladoNitrogeno("20/6/2015", "L2609015", "20/05/2015", "Argentina", -2.2);
        cordero.setMetodoCongelacion("Criogénica");
        cordero.setTiempoExposicion("6 meses");
        do {
            System.out.println("Ingrese 1 para visualizar la informacion de los productos frescos.\n"
                    + "Ingrese 2 para visualizar la informacion de los productos refrigerados.\n"
                    + "Ingrese 3 para visualizar la informacion de los productos congelados.\n"
                    + "Ingrese 4 para salir.");
            elige = teclado.nextInt();
            switch (elige) {
                case 1:
                    System.out.println("Productos frescos:");
                    System.out.println("Tomate\n");
                    tomate.printInfomationProducto();
                    System.out.println("Manzana\n");
                    manzana.printInfomationProducto();
                    break;
                case 2:
                    System.out.println("Productos refrigerados:");
                    System.out.println("Leche\n");
                    leche.printInformationProductoRefrigerado();
                    System.out.println("Jugo\n");
                    jugo.printInformationProductoRefrigerado();
                    System.out.println("Queso\n");
                    queso.printInformationProductoRefrigerado();
                    break;
                case 3:
                    System.out.println("PRODUCTOS CONGELADOS.\nCongelados por agua: ");
                    System.out.println("Pescado\n");
                    pescado.printInformationProductoCongeladoAgua();
                    System.out.println("Cangrejo\n");
                    cangrejo.printInformationProductoCongeladoAgua();
                    System.out.println("Mariscos\n");
                    mariscos.printInformationProductoCongeladoAgua();
                    System.out.println("Pulpo\n");
                    pulpo.printInformationProductoCongeladoAgua();
                    System.out.println("Cordero\n");
                    System.out.println("Congelados por nitrogeno:");
                    cordero.imprimirDatos();
                    break;
                case 4:
                    System.out.println("Finish");
                    break;
                default:
                    System.out.println("No valido");
                    break;
            }
        } while (elige < 4);
    }
}
