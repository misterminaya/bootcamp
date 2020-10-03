public class ProductoPrecioFijo extends Producto {

    private double precio;
    private double igv;
    private double valorVenta;

    public ProductoPrecioFijo(int codigo, String nombre, String categoria, double precio) {
        super(codigo, nombre, categoria);
        this.precio = precio;
        igv=0.18;
        valorVenta = (igv * precio)+precio;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getIgv() {
        return igv;
    }

    public void setIgv(double igv) {
        this.igv = igv;
    }

    public double getValorVenta() {
        return valorVenta;
    }

    public void setValorVenta(double valorVenta) {
        this.valorVenta = valorVenta;
    }

    public String toString() {
        return super.toString() + "\nCodigo: " + getCodigo() + "\nNombre: " + getNombre()
                + "\nCategoria: " + getCategoria()+ "\nPrecio: " + getPrecio()+ "\nIGV: " + getIgv()
                + "\nValor de precio FINAL: " + getValorVenta();
    }

}
