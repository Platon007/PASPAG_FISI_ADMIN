
package pe.edu.sistemas.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pe.edu.sistemas.modelo.conectar;

public class BuscarAlumnoController {
    
    
    private JdbcTemplate jdbcTemplate;
    
    public BuscarAlumnoController(){ 
        conectar con = new conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    @RequestMapping("/buscarAlumno.htm")
        
    public ModelAndView buscarAlumno() {
        
        ModelAndView mav = new ModelAndView();
        String sql1 = "SELECT NAME,CODE,EAP,EMAIL, CONCEPTO.id_concepto " +
"FROM USUARIO INNER JOIN TRANSACCION ON USUARIO.ID = TRANSACCION.ID " +
"	     INNER JOIN CONCEPTO ON TRANSACCION.ID_P = CONCEPTO.ID_P  " +
"	     INNER JOIN HISTORIAL_DE_TRANSACCION ON (TRANSACCION.ID = HISTORIAL_DE_TRANSACCION.ID_USUARIO  " +
"					     	AND  TRANSACCION.ID_P = HISTORIAL_DE_TRANSACCION.ID_CONCEPTO)  ";
        List datos = this.jdbcTemplate.queryForList(sql1);
        mav.addObject("datos",datos);
        mav.setViewName("buscarAlumno/buscarAlumno");
        return mav;
        //rrchc11@gmail.com
    }
   
   
   @RequestMapping("/buscar.htm")
    public ModelAndView buscar(HttpServletRequest request,HttpServletResponse res) {
        ModelAndView mav = new ModelAndView();
        String name =  request.getParameter("AlumnoBuscar");     
        String sql1 = "SELECT NAME,CODE,EAP,EMAIL, CONCEPTO.id_concepto " +
"FROM USUARIO INNER JOIN TRANSACCION ON USUARIO.ID = TRANSACCION.ID " +
"	     INNER JOIN CONCEPTO ON TRANSACCION.ID_P = CONCEPTO.ID_P  " +
"	     INNER JOIN HISTORIAL_DE_TRANSACCION ON (TRANSACCION.ID = HISTORIAL_DE_TRANSACCION.ID_USUARIO  " +
"					     	AND  TRANSACCION.ID_P = HISTORIAL_DE_TRANSACCION.ID_CONCEPTO) where(USUARIO.CODE ='"+name+"')" +
"              ";
        List datosNom = this.jdbcTemplate.queryForList(sql1); 
       
        mav.addObject("datos",datosNom);
        mav.setViewName("buscarAlumno/buscarAlumno");
        return mav;
    }
    
}
