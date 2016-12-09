package pe.edu.sistemas.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.sistemas.modelo.conectar;
import pe.edu.sistemas.modelo.Usuarios;
import pe.edu.sistemas.modelo.UsuariosValidar;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import pe.edu.sistemas.modelo.Administrador;
import pe.edu.sistemas.modelo.AdministradorValidar;

@Controller
@RequestMapping("newPerfil.htm")
public class newPerfilController {
    AdministradorValidar adminstradorValidar;
    private final JdbcTemplate jdbcTemplate;
    
    public newPerfilController() 
    {
        this.adminstradorValidar = new AdministradorValidar();
        conectar con=new conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar() );
    }
    @RequestMapping(method=RequestMethod.GET) 
    public ModelAndView form()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("nuevoPerfil/nuevoPerfil");
        mav.addObject("administrador",new Administrador());
        return mav;
    }
    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView form
        (
                @ModelAttribute("administrador") Administrador u,
                BindingResult result,
                SessionStatus status
        )
    {
        this.adminstradorValidar.validate(u, result);
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("nuevoPerfil/nuevoPerfil");
            mav.addObject("administrador",new Administrador());
            return mav;
        }else
        {
        this.jdbcTemplate.update
        (
        "insert into administrador (nombre,contrasenia ) values (?,?)",
        u.getNombre(),u.getClave());
         return new ModelAndView("redirect:/cargarData.htm");
        }   
    }
    public void carga(Administrador g){
        Administrador u = new Administrador();
        this.jdbcTemplate.update(
        "insert into administrador (nombre,contrasenia ) values (?,?)",
        u.getNombre(),u.getClave());
    }
    
    
}
