
package com.zemanek.jan.ItnetworkProjekt.Validátor;

import com.zemanek.jan.ItnetworkProjekt.entity.Pojisteni;
import java.time.LocalDate;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class PojisteniValidator implements Validator {

    
    
    //!!!!!!!!!!!!!!
    //ZATÍM V PROJEKTU NEPOUŽITÉ, POUZE PŘIPRAVENÉ K POUŽITÍ
    //NETESTOVÁNO
    //!!!!!!!!!!!!!!
    
    
    /**
     *
     * @param trida Třída
     * @return Vrací třídu, která bude použita k validaci.
     */
    @Override
    public boolean supports(Class<?> trida) {
        return Pojisteni.class.isAssignableFrom(trida);
        
    }

    /**
     *
     * @param target Třída k validaci.
     * @param errors Error
     */
    @Override
    public void validate(Object target, Errors errors) {
        Pojisteni pojisteni = (Pojisteni) target;
        
        if (isExpired(pojisteni) == false) {
            errors.rejectValue("platnostDo", "pojisteni.expired", "Po splatnosti");
        }
    }

    /**
     *
     * @param pojisteni Pojištění
     * @return Vrací true/false na základě, zda-li je datum před nebo po aktuálním datu.
     */
    public boolean isExpired(Pojisteni pojisteni) {
        if(pojisteni.getPlatnostDo().isAfter(LocalDate.now())){ 
        return false;
        }else{
        return true;
        }
    }

}
