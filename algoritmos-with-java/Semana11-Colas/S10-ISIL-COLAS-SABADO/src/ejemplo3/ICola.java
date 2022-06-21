/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejemplo3;

/**
 *
 * @author User
 */
public interface ICola<T> {
    
    public abstract Boolean isEmpty();
    public abstract void offer(T t);
    public abstract T poll();
    public abstract T peek();
    public abstract  void print();
    
}
