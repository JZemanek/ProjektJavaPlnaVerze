
package com.zemanek.jan.ItnetworkProjekt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
//Tabulka ve které se entita nachází. Pokud tabulka neexistuje, tbulku vytvoří
@Table(name = "Pojištění")
public class Pojisteni {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_pojištění")
    private int pojisteniId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_pojištěnce", nullable = false)
    @JsonIgnore
    private Pojistenec pojistenec;

    @Column(name = "typ_pojištění")
    private String typPojisteni;

    @Column(name = "předmět_pojištění")
    private String predmetPojisteni;

    @Column(name = "částka")
    private int castka;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "platnost_od")
    private LocalDate platnostOd;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "platnost_do")
    public LocalDate platnostDo;

    /**
     * Konstruktor
     * Hodnoty se vztahují k entitě Pojištění
     * @param pojisteniId id
     * @param pojistenec Pojištěnec, ke kterému se vztahuje pojištění
     * @param typPojisteni typ pojištění
     * @param predmetPojisteni Předmět pojištění
     * @param castka Čátka
     * @param platnostOd Platnost od
     * @param platnostDo Platnost do
     */
    public Pojisteni(int pojisteniId, Pojistenec pojistenec, String typPojisteni, String predmetPojisteni,
            int castka, LocalDate platnostOd, LocalDate platnostDo) {
        this.pojisteniId = pojisteniId;
        this.pojistenec = pojistenec;
        this.typPojisteni = typPojisteni;
        this.predmetPojisteni = predmetPojisteni;
        this.castka = castka;
        this.platnostOd = platnostOd;
        this.platnostDo = platnostDo;
    }

    /**
     * Prázdný kontruktor
     * nutný
     */
    public Pojisteni() {
    }

    
    // Settery a gettery
    
    
    /**
     *
     * @return
     */
    public int getPojisteniId() {
        return pojisteniId;
    }

    /**
     *
     * @param pojisteniId
     */
    public void setPojisteniId(int pojisteniId) {
        this.pojisteniId = pojisteniId;
    }

    /**
     *
     * @return
     */
    public Pojistenec getPojistenec() {
        return pojistenec;
    }

    /**
     *
     * @param pojistenec
     */
    public void setPojistenec(Pojistenec pojistenec) {
        this.pojistenec = pojistenec;
    }

    /**
     *
     * @return
     */
    public String getTypPojisteni() {
        return typPojisteni;
    }

    /**
     *
     * @param typPojisteni
     */
    public void setTypPojisteni(String typPojisteni) {
        this.typPojisteni = typPojisteni;
    }

    /**
     *
     * @return
     */
    public String getPredmetPojisteni() {
        return predmetPojisteni;
    }

    /**
     *
     * @param predmetPojisteni
     */
    public void setPredmetPojisteni(String predmetPojisteni) {
        this.predmetPojisteni = predmetPojisteni;
    }

    /**
     *
     * @return
     */
    public int getCastka() {
        return castka;
    }

    /**
     *
     * @param castka
     */
    public void setCastka(int castka) {
        this.castka = castka;
    }

    /**
     *
     * @return
     */
    public LocalDate getPlatnostOd() {
        return platnostOd;
    }

    /**
     *
     * @param platnostOd
     */
    public void setPlatnostOd(LocalDate platnostOd) {
        this.platnostOd = platnostOd;
    }

    /**
     *
     * @return
     */
    public LocalDate getPlatnostDo() {
        return platnostDo;
    }

    /**
     *
     * @param platnostDo
     */
    public void setPlatnostDo(LocalDate platnostDo) {
        this.platnostDo = platnostDo;
    }
}
