
package com.zemanek.jan.ItnetworkProjekt.pojistenci;

import com.zemanek.jan.ItnetworkProjekt.Validátor.PojistenecValidator;
import com.zemanek.jan.ItnetworkProjekt.entity.Pojistenec;
import com.zemanek.jan.ItnetworkProjekt.entity.Pojisteni;
import com.zemanek.jan.ItnetworkProjekt.pojisteni.PojisteniService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PojistenciController {

    private final PojisteniService pojisteniService;
    private final PojistenecService pojistenecService;
    private final PojistenecValidator validator;

    /**
     *
     * @param pojistenecService Service třída pojištěnce
     * @param validator Validátor pro kontrolu hodnot ve formuláří pro přidání pojištěnce
     * @param pojisteniService Service třída pojištění
     */
    @Autowired
    public PojistenciController(PojistenecService pojistenecService, PojistenecValidator validator, PojisteniService pojisteniService) {
        this.pojistenecService = pojistenecService;
        this.validator = validator;
        this.pojisteniService = pojisteniService;
    }

    /**
     * Vrací stránku s formulářem pro přidání nového pojištěnce
     * @param model Model pro přidání atributu
     * @return Zobrazí stránku s formulářem
     */
    @GetMapping("pridat-pojistence")
    public String zobrazFormular(Model model) {
        model.addAttribute("pojistenec", new Pojistenec());
        return "PridatPojistence";
    }

    /**
     * Vrací stránku se seznamem pojištěnců
     * @return Stránka se seznamem pojištěnců
     */
    @RequestMapping("seznam-pojistencu")
    public String VratStrankuSeznamPojistencu() {
        return "SeznamPojistencu";
    }

    /**
     * Metoda provede přidání nového pojištěnce a zároveň provádí validaci parametrů při zadávání parametrů nového pojištěnce
     * @param pojistenec Objekt pojištěnec, kterého budeme vytvářet.
     * @param bindingResult Binding result pro error v případě chyby zadávání parametrů ve formuláři.
     * @param model Model pro atribut pojištnce
     * @return Vrací se zpět na stránku se seznamem pojištěnců.
     */
    @PostMapping("pridat-pojistence")
    public String pridatPojistence(@ModelAttribute("pojistenec") Pojistenec pojistenec, BindingResult bindingResult, Model model) {
        // Validování pro zjištění chyb při zadávání parametrů nového pojištěnce
        validator.validate(pojistenec, bindingResult);
        //V případě chyby provede obnovení stránky s formulářem a zobrazí chybové zprávy.
        if (bindingResult.hasErrors()) {
            return "PridatPojistence";
        /*V případě správného vyplnění formuláře přidá nového pojištěnce, vrátí se na stránku se seznamem pojištěnců a zobrazí
          alert se zprávou o úspěšném přidání  
        */
        } else {
            pojistenecService.PridatPojistence(pojistenec);
            model.addAttribute(
                    "zobrazZprávu", true);
            return "redirect:seznam-pojistencu";
        }
    }

    /**
     * Metoda zobrazí stránku se seznamem všech pojištěnců.
     * @param model Model pro atribut
     * @return Přejde na stránku se seznamem pojištěnců
     */
    @GetMapping("seznam-pojistencu")
    public String zobrazSeznamPojistencu(Model model) {
        List<Pojistenec> seznamPojistencu = pojistenecService.ziskatSeznamPojistencu();
        model.addAttribute("seznamPojistencu", seznamPojistencu);
        return "SeznamPojistencu";
    }

    /**
     * Metoda odstraní všechny pojištění u daného pojištěnce a poté odstraní samotného pojištěnce na základě jeho id z url.
     * @param id Id pojištěnce z url adresy.
     * @return Vrací na stránku se seznamem pojištěnců.
     */
    @GetMapping("odstranit-pojistence")
    public String odstranitPojistence(@RequestParam("idPojistence") int id) {
        //Získá seznam pojištění pro daného pojištěnce
        List<Pojisteni> seznamPojisteni = pojisteniService.ZiskatSeznamPojisteniProPojistencePodleId(id);
        //Projde seznam a vymaže každé pojištění pro daného pojištěnce
        for(Pojisteni pojisteni : seznamPojisteni){
            pojisteniService.OdstranitPojisteniUPojistence(pojisteni.getPojisteniId());
        }
        //Odstraní pojištěnce
        pojistenecService.odstranitPojistence(id);
        //Vrátí se na stránku se seznamem pojištěnců
        return "redirect:/seznam-pojistencu";
    }
}
