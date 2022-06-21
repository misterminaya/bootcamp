/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapagrafos;

import java.util.List;

/**
 *
 * @author User
 */
public class Test {

    public static void main(String[] args) {

        Nodo lima = new Nodo("Lima");
        Nodo ica = new Nodo("Ica");
        Nodo callao = new Nodo("Callao");
        Nodo junin = new Nodo("Junin");
        Nodo arequipa = new Nodo("Arequipa");

        Enlace enlaceLimaJunin = new Enlace(lima, junin, 200.0);
        Enlace enlaceLimaCallao = new Enlace(lima, callao, 60.0);
        Enlace enlaceLimaIca = new Enlace(lima, ica, 70.0);
        Enlace enlaceLimaArequipa = new Enlace(lima, arequipa, 300.0);

        lima.setEnlaces(enlaceLimaJunin);
        lima.setEnlaces(enlaceLimaCallao);
        lima.setEnlaces(enlaceLimaIca);
        lima.setEnlaces(enlaceLimaArequipa);

        Mapa mapa = new Mapa();
        mapa.setNodo(lima);
        mapa.setNodo(ica);
        mapa.setNodo(callao);
        mapa.setNodo(junin);
        mapa.setNodo(arequipa);

        List<Nodo> nodos = mapa.getNodos();
        
        for (Nodo nodo : nodos) {
            System.out.println(""+nodo);
        }
        
        
    }

}
