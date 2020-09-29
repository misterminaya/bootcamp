package Ejercicio6;

public abstract class Persona {
  private int id;
  private String nombre;
  private String apellido;
  private String direccion;

    public Persona(int id, String nombre, String apellido, String direccion){
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
    }

    public Persona(String nombre, String apellido, String direccion){
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
    }
}
