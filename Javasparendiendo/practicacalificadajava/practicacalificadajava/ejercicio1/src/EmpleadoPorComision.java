public class EmpleadoPorComision extends Empleado {

    private int ventasMensuales;
    private double porcentajeComision;

    public EmpleadoPorComision(int codigo, String nombre, String apellido, int edad, char sexo, int dni, String correo, int ventasMensuales, double porcentajeComision) {
        super(codigo, nombre, apellido, edad, sexo, dni, correo);
        this.ventasMensuales = ventasMensuales;
        this.porcentajeComision = porcentajeComision;
    }

    public int getVentasMensuales() {
        return ventasMensuales;
    }

    public void setVentasMensuales(int ventasMensuales) {
        this.ventasMensuales = ventasMensuales;
    }

    public double getPorcentajeComision() {
        return porcentajeComision;
    }

    public void setPorcentajeComision(double porcentajeComision) {
        this.porcentajeComision = porcentajeComision;
    }

    public double calcularSueldoComision() {
        double monto = getVentasMensuales() * (porcentajeComision/100);
        return monto;
    }

    public String toString() {
        return super.toString() + "\nCodigo: " + getCodigo() + "\nNombre: " + getNombre()
                + "\nApellido: " + getApellido() + "\nEdad: " + getEdad() + "\nSexo: " + getSexo()
                + "\nDNI: " + getDni() + "\nCorreo: " + getCorreo()+"\nVentas mensuales : "+getVentasMensuales()
                +"\nSueldo: "+calcularSueldoComision();
    }

}
