/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio01;

public class ProductoRefrigerado extends Producto{
    
    private String codigoOrganismoSupervision;

    public ProductoRefrigerado(String fechaCaducidad, String numeroLote, String fechaEnvasado, String paisOrigen, String codigoOrganismoSupervision) {
        super(fechaCaducidad, numeroLote, fechaEnvasado, paisOrigen);
        this.codigoOrganismoSupervision=codigoOrganismoSupervision;
    }

    public String getCodigoOrganismoSupervision() {
        return codigoOrganismoSupervision;
    }

    public void setCodigoOrganismoSupervision(String codigoOrganismoSupervision) {
        this.codigoOrganismoSupervision = codigoOrganismoSupervision;
    }
    
    public void printInformationProductoRefrigerado(){
        System.out.println("El código organismo de supervisión alimentaria es: " + getCodigoOrganismoSupervision());
        printInfomationProducto();
        
    }
    
    
}
