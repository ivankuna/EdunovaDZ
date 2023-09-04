package edunova.model;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;

@Entity
public class Polaznik extends Entitet {

    private String brojUgovora;
    @OneToOne
    private Osoba osoba;

    public Polaznik() {

    }

    public Polaznik(int sifra, String brojUgovora, Osoba osoba) {
        super(sifra);
        this.brojUgovora = brojUgovora;
        this.osoba = osoba;
    }

    public String getBrojUgovora() {
        return brojUgovora;
    }

    public void setBrojUgovora(String brojUgovora) {
        this.brojUgovora = brojUgovora;
    }

    public Osoba getOsoba() {
        return osoba;
    }

    public void setOsoba(Osoba osoba) {
        this.osoba = osoba;
    }

}
