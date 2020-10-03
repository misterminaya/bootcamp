public class EmpleadoSueldoFijo extends Empleado {

    private String fechaInicioContrato;
    private double sueldoFijo;

    public EmpleadoSueldoFijo(int codigo, String nombre, String apellido, int edad, char sexo, int dni, String correo, String fechaInicioContrato, double sueldoFijo) {
        super(codigo, nombre, apellido, edad, sexo, dni, correo);
        this.fechaInicioContrato = fechaInicioContrato;
        this.sueldoFijo = sueldoFijo;
    }

    public String getFechaInicioContrato() {
        return fechaInicioContrato;
    }

    public void setFechaInicioContrato(String fechaInicioContrato) {
        this.fechaInicioContrato = fechaInicioContrato;
    }

    public double getSueldoFijo() {
        return sueldoFijo;
    }

    public void setSueldoFijo(double sueldoFijo) {
        this.sueldoFijo = sueldoFijo;
    }



    public String toString() {
        return super.toString() + "\nCodigo: " + getCodigo() + "\nNombre: " + getNombre()
                + "\nApellido: " + getApellido() + "\nEdad: " + getEdad() + "\nSexo: " + getSexo()
                + "\nDNI: " + getDni() + "\nCorreo: " + getCorreo()+"\nFecha de inicio de contrato: "+getFechaInicioContrato()
                +"\nSueldo: "+getSueldoFijo();
    }

}
