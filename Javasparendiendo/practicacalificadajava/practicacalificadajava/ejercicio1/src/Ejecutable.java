public class Ejecutable {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        System.out.println("*****  Empleado con sueldo FIJO  *****");
        EmpleadoSueldoFijo ef = new EmpleadoSueldoFijo(153, "joel", "bobadilla minaya", 22, 'M', 75309572, "prueba@gmail.com", "28/05/2020", 2200.00);
        System.out.println("Datos: " + ef.toString());

        System.out.println("");

        System.out.println("*****  Empleado con sueldo por COMISION  *****");
        EmpleadoPorComision ec = new EmpleadoPorComision(125, "Julio", "carranza mendonza", 50, 'M', 75463169, "prueba2@gmail.com", 20, 18.00);
        System.out.println("Datos: " + ec.toString());
    }

}
