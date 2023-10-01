
package com.zemanek.jan.ItnetworkProjekt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class RegistraceController {
    
    /**
     *
     * @return Vrací stránku registrace.
     */
    @GetMapping("/registrace")
    public String zobrazStrankuRegistrace(){
    return "Registrace";
    }
}
