package edunova.model;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;

@Entity
public class Predavac extends Entitet {

    private String iban;
    @OneToOne
    private Osoba osoba;

    public Predavac() {

    }

    public Predavac(int sifra, String iban, Osoba osoba) {
        super(sifra);
        this.iban = iban;
        this.osoba = osoba;
                
    }

    public String getIban() {
        return iban;
    }

    public void setIban(String iban) {
        this.iban = iban;
    }

    public Osoba getOsoba() {
        return osoba;
    }

    public void setOsoba(Osoba osoba) {
        this.osoba = osoba;
    }
}
