public class Ejecutable {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ProductoPrecioFijo pf = new ProductoPrecioFijo(12, "Coca Cola", "Gaseosa", 10);
        System.out.println(pf.toString());

        System.out.println("");

        ProductoPrecioVariable pv = new ProductoPrecioVariable(13, "Azucar", "Embutidos", 1, 2);
        pv.setPrecioUnidadMedida(2);
        System.out.println(pv.toString());
    }

}
