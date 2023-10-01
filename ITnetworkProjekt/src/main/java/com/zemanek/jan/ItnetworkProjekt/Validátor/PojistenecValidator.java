/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zemanek.jan.ItnetworkProjekt.Validátor;

import com.zemanek.jan.ItnetworkProjekt.entity.Pojistenec;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author janze
 */
@Component
public class PojistenecValidator implements Validator {

    /**
     *
     * @param trida Třída
     * @return Vrací třídu k validaci
     */
    @Override
    public boolean supports(Class<?> trida) {
        return Pojistenec.class.isAssignableFrom(trida);
    }

    /**
     * Celkově validuje, zda-li hodnoty odpovídají a jsou přesné. Pokud hodnoty nesouhlasí, vrátí chybovou hlášku.
     * @param target Objekt, který je cílem validace.
     * @param errors Error
     */
    @Override
    public void validate(Object target, Errors errors) {
        Pojistenec pojistenec = (Pojistenec) target;

        //Přijímá metodu ke zkontrolování hodnot.
        if (!isValidEmail(pojistenec.getEmail())) {
            errors.rejectValue("email", "InvalidEmail", "Špatný formát e-mailové adresy.");
        }
        //Přijímá metodu ke zkontrolování hodnot.
        if (!isValidPSC(pojistenec.getPsc())) {
            errors.reject("psc", "Špatný formát PSČ. Zadejte 5 kladných číslic ve tvaru \"12345\".");
        }
        //Přijímá metodu ke zkontrolování hodnot.
        if (!isValidTelCislo(pojistenec.getTelCislo())) {
            errors.rejectValue("telCislo", "neplatneTelCislo", "Neplatné telefonní číslo");
        }
    }

    /**
     *
     * @param email E-mai pojištěnce zadaný do formuláře
     * @return
     */
    public boolean isValidEmail(String email) {
        // Definování, jak má e-mail adresa vypadat a její formát.
        String regex = "^[A-Za-z0-9+_.-]+@(.+)$";

        // Vytvoření pattern objektu z regex výrazu.
        Pattern pattern = Pattern.compile(regex);

        // Vytvoření matcher objektu z patternu ke kontrole.
        Matcher matcher = pattern.matcher(email);

        // Zavolání metody matches na matcher objektu pro ověření shody s regex.
        return matcher.matches();
    }

    /**
     *
     * @param psc Psč pojištěnce zadaný do formuláře
     * @return Vrací true/false dle shody s hodnotou ve formuláři. ásledně je použito při validaci.
     */
    public boolean isValidPSC(int psc) {
        // Validace PSČ
        String pscString = String.valueOf(psc);
        //Zkontroluje délku psč a zda-li obsahuje pouze číslice.
        return pscString.length() == 5 && pscString.matches("\\d+");
    }

    /**
     *
     * @param telCislo Telefonní číslo pojištěnce zadané do formuláře.
     * @return Vrací true/false dle shody s hodnotou ve formuláři. ásledně je použito při validaci.
     */
    public boolean isValidTelCislo(int telCislo) {
        // Validace Tel
        String telCisloString = String.valueOf(telCislo);
        //Kontrola délky tel čísla a zda-li obsahuje pouze číslice.
        return telCisloString.length() == 9 && telCisloString.matches("\\d+");
    }
}
