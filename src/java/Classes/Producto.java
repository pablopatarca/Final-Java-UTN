/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

/**
 *
 * @author Pablo
 */
public class Producto {
        private int id;
	private String nombre;
	private String descripcion;
        private String presentacion;
        private int en_oferta;
        private int cantidad;
        private String imagen;
        private Double precio = 0.0;
        
        public int getId() {
            return id;
	}
	public void setId(int id) {
            this.id = id;
	}
        public void setPrecio(Double precio) {
            this.precio = precio;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String description) {
		this.descripcion = description;
	}
	public String getPresentacion() {
		return presentacion;
	}
	public void setPresentacion(String presentation) {
		this.presentacion = presentation;
	}
        public int getEnOferta() {
		return en_oferta;
	}
         public Double getPrecio() {
		return precio;
	}
	public void setEnOferta(int promoted) {
		this.en_oferta = promoted;
	}
        
        public void setCantidad(int cantidad){
            this.cantidad = cantidad;
        }
        
        public int getCanidad(){
            return cantidad;
        }
        
        public void setImagen(String imagen){
            this.imagen = imagen;
        }
        
        public String getImagen(){
            return imagen;
        }
        
}
