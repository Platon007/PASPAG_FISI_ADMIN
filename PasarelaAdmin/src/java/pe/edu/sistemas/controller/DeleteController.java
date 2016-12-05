
package pe.edu.sistemas.controller;

import pe.edu.sistemas.modelo.conectar;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


public class DeleteController {
    private JdbcTemplate jdbcTemplate;
    public DeleteController()
    {
        conectar con=new conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar() );
    }
    
    @RequestMapping("delete.htm")
    public ModelAndView home(HttpServletRequest request) 
    {
        String id=request.getParameter("id");
        this.jdbcTemplate.update(
                    "delete from usuario "
                + "where "
                + "code=? ",
        id);
        return new ModelAndView("redirect:/cargarData.htm");
    }
}
