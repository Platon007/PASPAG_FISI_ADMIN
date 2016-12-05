package pe.edu.sistemas.modelo;

public class Administrador {
  
    private String nombre,clave,edite;

    public Administrador() {
    }

    public Administrador(String nombre, String clave, String edite) {
        this.nombre = nombre;
        this.clave = clave;
        this.edite = edite;
    }

    public String getEdite() {
        return edite;
    }

    public void setEdite(String edite) {
        this.edite = edite;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    
}

