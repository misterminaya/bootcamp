/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clínica.nutricional;

public class Paciente extends Persona {
    private int fechaPrimeraConsulta;
    private String medicoTratante;

    public Paciente( String nombre, int edad, String RUC, String sexo, int peso, double altura,int fechaPrimeraConsulta, String medicoTratante) {
        super(nombre, edad, RUC, sexo, peso, altura);
        this.fechaPrimeraConsulta = fechaPrimeraConsulta;
        this.medicoTratante = medicoTratante;
    }

 

    public int getFechaPrimeraConsulta() {
        return fechaPrimeraConsulta;
    }

    public String getMedicoTratante() {
        return medicoTratante;
    }
    public double calcularIMC(){
       double IMC = getPeso()/(getAltura()*getAltura()); 
    //double IMC = getPeso()/(getAltura()*getAltura());
    return IMC;  
    
    }
    public void IMC(){
        System.out.println("su IMC es " +calcularIMC());
    
    }
    public void IMC2(){
    if(calcularIMC()>24.9)
            System.out.println("1");
    else if(calcularIMC()<18.5)
            System.out.println("-1");
    else 
            System.out.println("0");
    }
    
    
    public void IMC3(){
    if(calcularIMC()>24.9)
            System.out.println("USTED TIENE SOBREPESO");
    else if(calcularIMC()<18.5)
            System.out.println("USTED ESTA DEBAJO DE SU PESO");
    else 
            System.out.println("USTED TIENE UN PESO IDEAL");
    }
            
            
            public boolean esMayorDeEdad(){
        return getEdad()>=18;
            }
            
            
            public void bool (){
              System.out.println(esMayorDeEdad());

            }
            public void bool2 (){
                
               if(esMayorDeEdad()==true) {
              System.out.println("ES MAYOR DE EDAD");
               }
               else if(esMayorDeEdad()==false){
                   System.out.println("ES MENOR DE EDAD");
               }
            }
            
            public String toString(){
            return "Nombre: "+getNombre()+ "\n"+
                    "Edad: "+getEdad()+ "\n"+
                    "RUC: "+getRUC()+ "\n"+
                    "Sexo: "+getSexo()+ "\n"+
                    "Peso: "+getPeso()+ "\n"+
                    "Altura: "+getAltura()+ "\n"+
                "Fecha: " + getFechaPrimeraConsulta()+ "\n"+ 
                 "Medico: " + getMedicoTratante();
            }
            
            public void comprobarSexo(){
                if(getSexo().matches("M"))
                    System.out.println(getSexo());
                else if (getSexo().matches("F"))
                    System.out.println(getSexo());
                else
                    System.out.println("error");
            }

           
            
   
}
