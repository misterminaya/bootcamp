/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapagrafos;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class Mapa {

    private List<Nodo> nodos;

    public List<Nodo> getNodos() {
        return nodos;
    }

    public void setNodo(Nodo nodo) {
        if (nodos == null) {
            nodos = new ArrayList<>();
        }
        nodos.add(nodo);
    }

    @Override
    public String toString() {
        return "Mapa{" + "nodos=" + nodos + '}';
    }
    
    

}
