/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zemanek.jan.ItnetworkProjekt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author janze
 */
@Controller
public class AppController {

    /**
     *
     * @return Vrácí domovskou stránku v případě, kdy se zadá samotná adresa.
     */
    @GetMapping("/")
    public String zobrazHlavniStrankuBezZadaniPresneAdresy() {
        return "Homepage";
    }

    /**
     *
     * @return Vrací domovskou stránku pokud je zadaná adresa s odkazem na domovskou stránku.
     */
    @GetMapping("/homepage")
    public String ZobrazHlavniStranku() {
        return "Homepage";
    }

    /**
     *
     * @return Vrací stránku "O nás"
     */
    @GetMapping("/o-nas")
    public String ZobrazitStrankuONas() {
        return "ONas";
    }

}
