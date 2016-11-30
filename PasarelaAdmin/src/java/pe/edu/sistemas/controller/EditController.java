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
        int id=Integer.parseInt(request.getParameter("id"));
        Usuarios datos=this.selectUsuario(id);
        mav.setViewName("edit/edit");
        mav.addObject("usuarios",new Usuarios(datos.getId_usuario(),datos.getNombre(),datos.getCodigo(),datos.getCorreo(),datos.getEscuela()));
        return mav;
    }
    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView form
        (
                @ModelAttribute("usuarios") Usuarios u,
                BindingResult result,
                SessionStatus status,
                HttpServletRequest request
        )
    {
        this.usuariosValidar.validate(u, result);
        if(result.hasErrors())
        {
             ModelAndView mav=new ModelAndView();
            int id=Integer.parseInt(request.getParameter("id"));
            Usuarios datos=this.selectUsuario(id);
            mav.setViewName("edit/edit");
            mav.addObject("usuarios",new Usuarios(datos.getId_usuario(),datos.getNombre(),datos.getCodigo(),datos.getCorreo(),datos.getEscuela()));
            return mav;
        }else
        {
            int id=Integer.parseInt(request.getParameter("id"));
        this.jdbcTemplate.update("update usuarios set nombre=?, codigo=?, correo=?, escuela=? where id_usuarios=?",
         u.getNombre(),u.getCodigo(),u.getCorreo(),u.getEscuela(),id);
         return new ModelAndView("redirect:/cargarData.htm");
        }
        
    }
    public Usuarios selectUsuario(int id) 
    {
        final Usuarios user = new Usuarios();
        String quer = "SELECT * FROM usuarios WHERE id_usuarios='" + id+"'";
        return (Usuarios) jdbcTemplate.query
        (  
                quer, new ResultSetExtractor<Usuarios>() 
            {
                public Usuarios extractData(ResultSet rs) throws SQLException, DataAccessException {
                    if (rs.next()) {
                        user.setNombre(rs.getString("nombre"));
                        user.setCodigo(rs.getString("codigo"));
                        user.setCorreo(rs.getString("correo"));
                        user.setEscuela(rs.getString("escuela"));
                    }
                    return user;
                }


            }
        );
    }
}

