public class ProductoPrecioVariable extends Producto {

    private double PrecioUnidadMedida;
    private double igv;
    private double cantidad;
    private double valorVenta;

    public ProductoPrecioVariable(int codigo, String nombre, String categoria, double cantidad, double precioUnidadMedida) {
        super(codigo, nombre, categoria);
        igv = precioUnidadMedida * cantidad * 0.18;
        valorVenta = igv + (cantidad * precioUnidadMedida);
    }

    public double getPrecioUnidadMedida() {
        return PrecioUnidadMedida;
    }

    public void setPrecioUnidadMedida(double PrecioUnidadMedida) {
        this.PrecioUnidadMedida = PrecioUnidadMedida;
    }

    public double getIgv() {
        return igv;
    }

    public void setIgv(double igv) {
        this.igv = igv;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public double getValorVenta() {
        return valorVenta;
    }

    public void setValorVenta(double valorVenta) {
        this.valorVenta = valorVenta;
    }

    public String toString() {
        return super.toString() + "\nCodigo: " + getCodigo() + "\nNombre: " + getNombre()
                + "\nCategoria: " + getCategoria() + "\nPrecio por gramo: " + getPrecioUnidadMedida() + "\nIGV: " + getIgv()
                + "\nCantidad: " + getCantidad() + "\nValor de precio FINAL: " + getValorVenta();
    }

}
