
package com.zemanek.jan.ItnetworkProjekt.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.PositiveOrZero;

@Entity
//Tabulka ve které se entita nachází. Pokud tabulka neexistuje, tbulku vytvoří
@Table(name = "Pojištěnci")
public class Pojistenec {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_pojištěnce")
    private int id;

    @Column(name = "jméno")
    private String jmeno;

    @Column(name = "příjmení")
    private String prijmeni;

    @Column(name = "e-mail")
    @Email(message = "Špatný formát e-mailové adresy.")
    private String email;

    @Column(name = "tel_číslo")
    @PositiveOrZero
    @Digits(integer = 9, fraction = 0)
    private int telCislo;

    @Column(name = "adresa")
    private String uliceACisloPopisne;

    @Column(name = "město")
    private String mesto;

    @Column(name = "psč ")
    @PositiveOrZero()
    @Digits(integer = 5, fraction = 0)
    private int psc;

    /**
     * Konstruktor
     * Všechny hodnoty se vztahuj k entitě Pojištěnec.
     * @param id ID
     * @param jmeno Jméno
     * @param prijmeni Příjmení
     * @param email e-mail
     * @param telCislo Telefonní číslo
     * @param uliceACisloPopisne Ulice včetně čísla popisného
     * @param mesto Město
     * @param psc Psč
     */
    public Pojistenec(int id, String jmeno, String prijmeni, String email, int telCislo, String uliceACisloPopisne, String mesto, int psc) {
        this.id = id;
        this.jmeno = jmeno;
        this.prijmeni = prijmeni;
        this.email = email;
        this.telCislo = telCislo;
        this.uliceACisloPopisne = uliceACisloPopisne;
        this.mesto = mesto;
        this.psc = psc;
    }

    /**
     * Prázdný konstruktor pojištěnce
     */
    public Pojistenec() {

    }

    /**
     *
     * @return Vrací jméno
     */
    public String getJmeno() {
        return jmeno;
    }

    /**
     * Nastaví jméno
     * @param jmeno Jméno pojištěnce
     */
    public void setJmeno(String jmeno) {
        this.jmeno = jmeno;
    }

    /**
     *
     * @return Vrací příjmení
     */
    public String getPrijmeni() {
        return prijmeni;
    }

    /**
     * Nastaví příjmení
     * @param prijmeni Příjmení pojištěnce
     */
    public void setPrijmeni(String prijmeni) {
        this.prijmeni = prijmeni;
    }

    /**
     *
     * @return Vrací e-mail pojištěnce
     */
    public String getEmail() {
        return email;
    }

    /**
     * Nastaví e-mail pojištěnce
     * @param email E-mail pojištěnce
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     *
     * @return Vrací telefonní číslo pojištěnce
     */
    public int getTelCislo() {
        return telCislo;
    }

    /**
     * Nastaví telefonní číslo pojištěnce
     * @param telCislo Telefonní číslo pojištěnce
     */
    public void setTelCislo(int telCislo) {
        this.telCislo = telCislo;
    }

    /**
     * 
     * @return Vrací ulici a č.p. pojištěnce
     */
    public String getUliceACisloPopisne() {
        return uliceACisloPopisne;
    }

    /**
     * Nastaví adresu pojištěnce
     * @param uliceACisloPopisne Ulice a č.p. pojištěnce
     */
    public void setUliceACisloPopisne(String uliceACisloPopisne) {
        this.uliceACisloPopisne = uliceACisloPopisne;
    }

    /**
     *
     * @return Vrací město pojištěnce
     */
    public String getMesto() {
        return mesto;
    }

    /**
     * Nastaví město pojištěnce
     * @param mesto Město pojištěnce
     */
    public void setMesto(String mesto) {
        this.mesto = mesto;
    }

    /**
     * 
     * @return Vrací psč pojištěnce
     */
    public int getPsc() {
        return psc;
    }

    /**
     * Nastaví psč pojištěnce
     * @param psc Psč pojištěnce
     */
    public void setPsc(int psc) {
        this.psc = psc;
    }

    /**
     *
     * @return Vrací id pojištěnce
     */
    public int getId() {
        return id;
    }

    /**
     * Nastaví id pojištěnce
     * @param id id pojištěnce
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * To string
     * @return
     */
    @Override
    public String toString() {
        return "Pojistenec{" + "id=" + id + ", jmeno=" + jmeno + ", prijmeni=" + prijmeni + ", email=" + email + ", telCislo=" + telCislo + ", uliceACisloPopisne=" + uliceACisloPopisne + ", mesto=" + mesto + ", psc=" + psc + '}';
    }



}
