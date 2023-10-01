
package com.zemanek.jan.ItnetworkProjekt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PrihlaseniController {

    /**
     *
     * @return Vrací stránku přihlášení.
     */
    @GetMapping("/login")
    public String loginControl() {
        return "Login";
    }
}
