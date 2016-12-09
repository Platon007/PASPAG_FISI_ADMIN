package pe.edu.sistemas.modelo;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class AdministradorValidar implements Validator{
     private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
   + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
   
     private Pattern pattern;
     private Matcher matcher;
    
    @Override
    public boolean supports(Class<?> type) 
    {
        return Administrador.class.isAssignableFrom(type);
    }

   
    public void validate(Object o, Errors errors) {
        Usuarios administrador=(Usuarios)o;
         ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nombre",
        "required.nombre", "El campo Nombre es Obligatorio.");
    }
}


