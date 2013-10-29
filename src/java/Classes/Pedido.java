/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Pablo
 */
public class Pedido {
   
    private int id;
    private Cliente cliente;
    private ArrayList<Producto> listaProductos;
    double total = 0;
    String fecha;
    
    public Cliente getCliente() {
		return cliente;
    }
    public int getId() {
		return id;
    }
    
    public void setListaProductos(ArrayList<Producto> listaProductos){
        this.listaProductos = listaProductos;
    }
    
    public ArrayList<Producto> getListaProductos(){
        return listaProductos;
    }
    
    public void setCliente(Cliente cliente){
        this.cliente = cliente;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public void setTotal(double total){
        this.total = total;
    }
    
    public double getTotal(){
        return total;
    }
    
    
    public double calcularTotal(){
        total = 0;
        for (Producto producto : listaProductos){
            total = total + (producto.getPrecio() * producto.getCanidad());
        }
        return total;
    }
    
    public void setFecha(String fecha){
        this.fecha = fecha;
    }
    
    public String getFecha(){
        /*
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy");
        return sdf.format(sdf.parse(fecha));
        * 07-06-2013
        */
        String year = this.fecha.substring(0, 4);
        String month = this.fecha.substring(5, 7);
        String day = this.fecha.substring(8, 10);
        String formated_fecha = day + "/" + month + "/" + year;
        
        return formated_fecha;
    }
    
    public String getFechaSQL(){
        return fecha;
    }
}
   
