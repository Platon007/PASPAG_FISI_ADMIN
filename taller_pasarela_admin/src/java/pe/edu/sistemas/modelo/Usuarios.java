package pe.edu.sistemas.modelo;


public class Usuarios {
    
    private String nombre,codigo,correo,escuela;

    public Usuarios() {
    }


    public Usuarios( String nombre, String codigo, String correo, String escuela) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.correo = correo;
        this.escuela = escuela;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getEscuela() {
        return escuela;
    }

    public void setEscuela(String escuela) {
        this.escuela = escuela;
    }
  
}
