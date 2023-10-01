/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zemanek.jan.ItnetworkProjekt.pojisteni;

import com.zemanek.jan.ItnetworkProjekt.entity.Pojistenec;
import com.zemanek.jan.ItnetworkProjekt.entity.Pojisteni;
import com.zemanek.jan.ItnetworkProjekt.repository.PojisteniRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author janze
 */
@Service
public class PojisteniService {

    private PojisteniRepository pojisteniRepository;

    /**
     *
     * @param pojisteniRepository Repository pro práci s databází
     */
    @Autowired
    public PojisteniService(PojisteniRepository pojisteniRepository) {
        this.pojisteniRepository = pojisteniRepository;
    }

    /**
     *
     * @param pojisteni Objekt pojištění
     * @return Uložení nového pojištění do databáze
     */
    public Pojisteni PridatNovePojisteni(Pojisteni pojisteni) {
        return pojisteniRepository.save(pojisteni);
    }

    /**
     *
     * @param idPojistence Id pojištěnce se kterým se bude pracovat
     * @return Nalezení všechna pojištění pro daného pojištěnce na základě jeho id
     */
    public List<Pojisteni> ZiskatSeznamPojisteniProPojistencePodleId(int idPojistence) {
        return pojisteniRepository.findByPojistenecId(idPojistence);
    }

    /**
     *
     * @param id Id pojištění
     * @return Nalezení určitého pojištění na základě jeho id
     */
    public Pojisteni VratPojisteniPodleId(int id) {
        return pojisteniRepository.findByPojisteniId(id);
    }

    /**
     *
     * @return
     */
    public List<Pojisteni> VratSeznamVsechPojisteni(){
        return pojisteniRepository.findAll();
    }
    
    /**
     *Odstraní pojištění na základě jeho id
     * @param id Id pojištění
     */
    public void OdstranitPojisteniUPojistence(int id) {
        pojisteniRepository.deleteById(id);
    }
    
    /**
     *Odstraní pojištění na základě hodnot v metodě třídy controlleru
     * @param pojisteni Objekt pojištění
     */
    public void OdstraniPojisteni(Pojisteni pojisteni){
        pojisteniRepository.delete(pojisteni);
    }
}