/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zemanek.jan.ItnetworkProjekt.pojistenci;

import com.zemanek.jan.ItnetworkProjekt.entity.Pojistenec;
import com.zemanek.jan.ItnetworkProjekt.entity.Pojisteni;
import com.zemanek.jan.ItnetworkProjekt.repository.PojistenciRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author janze
 */
@Service
public class PojistenecService {
    private final PojistenciRepository pojistenciRepository;

    /**
     *
     * @param pojistenciRepository Repository pro práci s databází
     */
    @Autowired
    public PojistenecService(PojistenciRepository pojistenciRepository) {
        this.pojistenciRepository = pojistenciRepository;
    }
    
    /**
     *
     * @param pojistenec Objekte pojištěnce
     * @return Uložení nového pojištěnce do databáze
     */
    public Pojistenec PridatPojistence(Pojistenec pojistenec){
        return pojistenciRepository.save(pojistenec);
    }
    
    /**
     *
     * @return Vrací seznam všech pojištěnců
     */
    public List<Pojistenec> ziskatSeznamPojistencu(){
        return pojistenciRepository.findAll();
    }
    
    /**
     * Odstraní pojištěnce na základě jeho id
     * @param id Id pojištěnce
     */
    public void odstranitPojistence(int id){
        pojistenciRepository.deleteById(id);
    }
        
    /**
     *
     * @param id id pojištěnce
     * @return Vrací pojištěnce na základě jeho id
     */
    public Pojistenec ziskatPojistencePodleId(int id){
        return pojistenciRepository.findById(id).orElse(null);
    }
}
