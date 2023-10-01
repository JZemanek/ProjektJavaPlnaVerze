
package com.zemanek.jan.ItnetworkProjekt.repository;

import com.zemanek.jan.ItnetworkProjekt.entity.Pojisteni;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PojisteniRepository extends JpaRepository<Pojisteni, Integer> {
    
    /**
     *
     * @param idPojistence Id pojištěnce
     * @return Vrací seznam pojištění pro daného pojištěnce
     */
    List<Pojisteni> findByPojistenecId(int idPojistence);
    
    /**
     *
     * @param idPojisteni Id pojištěné
     * @return Najde určité pojištění na základě jeho id
     */
    Pojisteni findByPojisteniId(int idPojisteni);
}
