package pe.edu.sistemas.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pe.edu.sistemas.modelo.conectar;

@Controller
public class homeController 
{
    private JdbcTemplate jdbcTemplate;
    
    public homeController(){ 
        conectar con = new conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
  
    
    @RequestMapping("privilegios.htm")
  public ModelAndView privilegios(HttpServletRequest request,HttpServletResponse res) {
        ModelAndView mav = new ModelAndView();
        String name =  request.getParameter("AdministradorBuscar"); 
        System.out.println(""+name);
        String sql1 = "select nombre from administrador where contraseniaDeEdicion = '"+name+" ' ";
        List datosNom = this.jdbcTemplate.queryForList(sql1); 
       if(datosNom==null){
        mav.addObject("datos","false");
        mav.setViewName("nuevoPerfil/nuevoPerfil");
        return mav;
       }
       else{
        mav.addObject("datos","true");
        
           mav.setViewName("nuevoPerfil/nuevoPerfil");
        return mav;
       }
    }
  
     @RequestMapping("home.htm")
    public ModelAndView home() {
        
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("home/home");
//        return mav;
          String sql1 = "select nombre from administrador";
          String sql2 = "select contrasenia from administrador";
          List datosNom = this.jdbcTemplate.queryForList(sql1);
          List datosPass = this.jdbcTemplate.queryForList(sql2);
          System.out.println("------------------------------------ ");
          
          String eco = "economia";
          String eco2 = "{NOMBRE="+eco+"}";
          
          System.out.println(datosNom.get(0));
          System.out.println(datosPass.get(0));
          
               return new ModelAndView("home/home", "m", "Ingrese datos");         
     
          
    }
    
    @RequestMapping("login.htm")
    public ModelAndView login(HttpServletRequest request,HttpServletResponse res) {
        
        ModelAndView mav = new ModelAndView();
          String sql1 = "select nombre from administrador";
          String sql2 = "select contrasenia from administrador";
          List datosNom = this.jdbcTemplate.queryForList(sql1);
          List datosPass = this.jdbcTemplate.queryForList(sql2);
          
          
          String name =  request.getParameter("name");  
          String password = request.getParameter("password");
          
          //name2.equals(name) && pass2.equals(password)
          System.out.println(name + "------" + password);
          String name2 = "{nombre="+name+"}";
          String pass2="{contrasenia="+password+"}";
            if (name2.equals(datosNom.get(0).toString()) && pass2.equals(datosPass.get(0).toString()) ) {
                  String Message = "Login Exitoso";
          String sql = "select * from usuario";
          List datos = this.jdbcTemplate.queryForList(sql);
          mav.addObject("datos",datos);
          mav.setViewName("mostrarData/mostrarData");
          return mav;
          } else if (name2.equals(datosNom.get(1).toString()) && pass2.equals(datosPass.get(1).toString()) ) {
                  String Message = "Login Exitoso";
          String sql = "select * from usuario";
          List datos = this.jdbcTemplate.queryForList(sql);
          mav.addObject("datos",datos);
          mav.setViewName("cargarData/cargarData");
          return mav;
            
            //String Message = "Usuario Incorrecto";
            //return new ModelAndView("home/home", "m", Message);     
        }else{
            String Message = "Usuario Incorrecto";
            return new ModelAndView("home/home", "m", Message);     
          }
    }
   
    
     @RequestMapping("Excel.htm")
    public ModelAndView Excel() {      
        ModelAndView mav = new ModelAndView();
        String sql = "select * from usuario";
        List datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("datos",datos);
        mav.setViewName("LeerExcel/Excel");
        return mav;
    }
   
    @RequestMapping("cargarData.htm")
    public ModelAndView cagarData() {        
        ModelAndView mav = new ModelAndView();
        String sql = "select * from usuario";
        List datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("datos",datos);
        mav.setViewName("cargarData/cargarData");
        return mav;
    }
    @RequestMapping("mostrarData.htm")
    public ModelAndView mostrarData() {
        
        ModelAndView mav = new ModelAndView();
        String sql = "select * from usuario";
        List datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("datos",datos);
        mav.setViewName("mostrarData/mostrarData");
        return mav;
    }

}
