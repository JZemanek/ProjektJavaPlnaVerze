
package com.zemanek.jan.ItnetworkProjekt.pojisteni;

import com.zemanek.jan.ItnetworkProjekt.entity.Pojistenec;
import com.zemanek.jan.ItnetworkProjekt.entity.Pojisteni;
import com.zemanek.jan.ItnetworkProjekt.pojistenci.PojistenecService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PojisteniController {

    private PojisteniService pojisteniService;
    private PojistenecService pojistenecService;

    /**
     *
     * @param pojisteniService Service třída pro pojištění
     * @param pojistenecService Service třída pro pojištěnce
     */
    @Autowired
    public PojisteniController(PojisteniService pojisteniService, PojistenecService pojistenecService) {
        this.pojisteniService = pojisteniService;
        this.pojistenecService = pojistenecService;
    }

    /**
     *Zobrazí stránku s detaily pojištěnce včetně jeho pojištění
     * @param pojistenec Objekt pojištěnce
     * @param idPojistence Id pojištěnce
     * @param model Model pro atributy
     * @return Vrátí stránku s detaily pojištěnce
     */
    @GetMapping("detaily-pojistence")
    public String ZobrazDetailyPojistence(Pojistenec pojistenec, int idPojistence, Model model) {
        pojistenec = pojistenecService.ziskatPojistencePodleId(idPojistence);
        model.addAttribute("idPojistence", idPojistence);
        model.addAttribute("pojistenec", pojistenec);
        //Získá seznam pojištění na základě id pojištěnce
        List<Pojisteni> seznamPojisteniProPojistence = pojisteniService.ZiskatSeznamPojisteniProPojistencePodleId(idPojistence);
        model.addAttribute("seznamPojisteniProPojistence", seznamPojisteniProPojistence);
        return "PojistenecDetaily";
    }
    
    /**
     * Metoda zobrazí stránku se seznamem pojištění a se jménem pojištěnce, ke kterému se pojištění vztahuje
     * @param pojisteni Poištění
     * @param pojistenec Pojištěnec
     * @param model Model
     * @return Vrací stránku se seznamem pojištění
     */
    @GetMapping("seznam-pojisteni")
    public String VratStrankuSeSeznamemPojisteni(Pojisteni pojisteni, Pojistenec pojistenec, Model model){
        //Získání seznamu všech pojištění.
        List<Pojisteni> seznamVsechPojisteni = pojisteniService.VratSeznamVsechPojisteni();
        //Získání seznamu všech pojištěnců
        List<Pojistenec> seznamVsechPojistencu = pojistenecService.ziskatSeznamPojistencu();
        //Vytvoření atributu pro seznam pojištěnců.
        model.addAttribute("seznamVsechPojistencu", seznamVsechPojistencu);
        //Vytvoření atributu pro seznam pojištění.
        model.addAttribute("seznamVsechPojisteni", seznamVsechPojisteni);
        //Vrací stránku se seznamem pojištění
    return "SeznamPojisteni";
} 
    
    
    /**
     * Vrací formulář pro přidání nového pojištění pro určitého pojištěnce
     * @param idPojistence Id pojištěnce
     * @param pojistenec Objekt pojištěnec
     * @param model Model pro atributy
     * @return Zobrazí formulář pro přidání pojištění
     */
    @GetMapping("/pridat-pojisteni")
    public String ZobrazFormularProPridaniPojisteni(@RequestParam("idPojistence") int idPojistence, Pojistenec pojistenec, Model model) {
        //Získá pojištěnce na základě jeho id
        pojistenec = pojistenecService.ziskatPojistencePodleId(idPojistence);
        model.addAttribute("idPojistence", idPojistence);
        model.addAttribute("pojistenec", pojistenec);
        return "PridatPojisteni";
    }

    /**
     * Metoda přidává nové pojištění k určitému pojištěnci, na základě id pojištěnce z url adresy.
     * @param pojisteni Objekt pojištění
     * @param pojistenec Objekt pojištěnce
     * @param redirectAttributes Zobrazí zprávu - alert s informací o úspěšném přidání
     * @return Vrací zpět na stránku s detaily pojištěnce
     */
    @PostMapping("/pridat-pojisteni")
    public String PridatNovePojisteni(@ModelAttribute Pojisteni pojisteni, @ModelAttribute Pojistenec pojistenec,
            RedirectAttributes redirectAttributes) {
        //Přidá nové pojištění
        pojisteniService.PridatNovePojisteni(pojisteni);
        //Získá id pojištěnce
        int idPojistence = pojisteni.getPojistenec().getId();
        //Vrací zprávu s informací o úspěšném přidání
        redirectAttributes.addFlashAttribute("zobrazZpravu", true);
        //Vrátí se na stránku s detaily pojištěnce
        return "redirect:detaily-pojistence?idPojistence=" + idPojistence;
    }
    
    /**
     * Metoda pro odstranění pojištění u určitého pojištěnce
     * @param id id pojištění
     * @return Vrací stránku zpět na detaily pojištěnce
     */
    @GetMapping("odstranit-pojisteni/{id}")
    public String OdstranitPojisteniUPojistence(@PathVariable int id){
        //Získání určitého pojištění na základě jeho ID
        Pojisteni pojisteni = pojisteniService.VratPojisteniPodleId(id);
        //Získání id pojištěnce
        int idPojistence = pojisteni.getPojistenec().getId();
        //Odstranit určté pojištění na základě jeho id
        pojisteniService.OdstranitPojisteniUPojistence(id);
        return "redirect:/detaily-pojistence?idPojistence=" + idPojistence;
    }
}
