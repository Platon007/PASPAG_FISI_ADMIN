package pe.edu.sistemas.controller;

import pe.edu.sistemas.modelo.conectar;
import pe.edu.sistemas.modelo.Usuarios;
import pe.edu.sistemas.modelo.UsuariosValidar;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("edit.htm")
public class EditController 
{
    UsuariosValidar usuariosValidar;
    private JdbcTemplate jdbcTemplate;
     
    
    public EditController() 
    {
        this.usuariosValidar=new UsuariosValidar();
        conectar con=new conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar() );
    }
    
    @RequestMapping(method=RequestMethod.GET) 
    public ModelAndView form(HttpServletRequest request)
    {
        ModelAndView mav=new ModelAndView();
        String id=request.getParameter("id");
        System.out.println(""+id);
        Usuarios datos=this.selectUsuario(id);
        mav.setViewName("edit/edit");
        mav.addObject("usuario",new Usuarios(datos.getNombre(),datos.getCodigo(),datos.getCorreo(),datos.getEscuela()));
        return mav;
    }
    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView form
        (
                @ModelAttribute("usuario") Usuarios u,
                BindingResult result,
                SessionStatus status,
                HttpServletRequest request
        )
    {
        this.usuariosValidar.validate(u, result);
        if(result.hasErrors())
        {
             ModelAndView mav=new ModelAndView();
            String id=request.getParameter("id");
        System.out.println(""+id);
       
            Usuarios datos=this.selectUsuario(id);
            mav.setViewName("edit/edit");
            mav.addObject("usuario",new Usuarios(datos.getNombre(),datos.getCodigo(),datos.getCorreo(),datos.getEscuela()));
            return mav;
        }
        else
        {
        int id=Integer.parseInt(request.getParameter("id"));
        this.jdbcTemplate.update("update usuario set name=?, email=?, eap=? where code=?",
         u.getNombre(),u.getCorreo(),u.getEscuela(),id);
         return new ModelAndView("redirect:/mostrarData.htm");
        }
    }
        
    public Usuarios selectUsuario(String id) 
    {
        final Usuarios user = new Usuarios();
        String quer = "SELECT * FROM usuario WHERE code='" + id+"'";
        return (Usuarios) jdbcTemplate.query
        (  
                quer, new ResultSetExtractor<Usuarios>() 
            {
                public Usuarios extractData(ResultSet rs) throws SQLException, DataAccessException {
                    if (rs.next()) {
                        user.setNombre(rs.getString("name"));
                        user.setCodigo(rs.getString("code"));
                        user.setCorreo(rs.getString("email"));
                        user.setEscuela(rs.getString("eap"));
                    }            
                    return user;
                }


            }
        );
    }
}

