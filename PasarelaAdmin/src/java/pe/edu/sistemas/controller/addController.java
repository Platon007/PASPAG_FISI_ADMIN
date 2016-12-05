package pe.edu.sistemas.controller;

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

@Controller
@RequestMapping("add.htm")
public class addController {
    UsuariosValidar usuariosValidar;
    private JdbcTemplate jdbcTemplate;
    
    public addController() 
    {
        this.usuariosValidar=new UsuariosValidar();
        conectar con=new conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar() );
    }
    @RequestMapping(method=RequestMethod.GET) 
    public ModelAndView form()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("add/add");
        mav.addObject("usuario",new Usuarios());
        return mav;
    }
    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView form
        (
                @ModelAttribute("usuario") Usuarios u,
                BindingResult result,
                SessionStatus status
        )
    {
        this.usuariosValidar.validate(u, result);
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("add/add");
            mav.addObject("usuario",new Usuarios());
            return mav;
        }else
        {
        this.jdbcTemplate.update
        (
        "insert into usuario (name,code,email,eap ) values (?,?,?,?)",
        u.getNombre(),u.getCodigo(),u.getCorreo(),u.getEscuela()
        );
         return new ModelAndView("redirect:cargarData.htm");
        }   
    }
    public void carga(Usuarios g){
        Usuarios u = new Usuarios();
        this.jdbcTemplate.update(
        "insert into usuario (name,code,email,eap ) values (?,?,?,?,?)",
        u.getNombre(),u.getCodigo(),u.getCorreo(),u.getEscuela());
    }
}
