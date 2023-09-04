/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edunova.util;

import com.github.javafaker.Faker;
import edunova.model.Grupa;
import edunova.model.Osoba;
import edunova.model.Polaznik;
import edunova.model.Predavac;
import edunova.model.Smjer;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author ivank
 */
public class PocetniInsert {
       
    private static final int BROJ_SMJEROVA = 12;
    private static final int BROJ_POLAZNIKA = 11256;
    private static final int BROJ_PREDAVACA = 7;
    private static final int BROJ_OSOBA = BROJ_POLAZNIKA + BROJ_PREDAVACA;
    private static final int BROJ_GRUPA = 220;
    
    private Faker faker;
    private Session session;
    private List<Osoba> osobe;
    private List<Osoba> osobeTemp;
    private List<Smjer> smjerovi;
    private List<Polaznik> polaznici;
    private List<Predavac> predavaci;

    public PocetniInsert() {
        faker = new Faker();
        session = HibernateUtil.getSession();
        osobe = new ArrayList<>();
        osobeTemp = new ArrayList<>();
        smjerovi = new ArrayList<>();
        polaznici = new ArrayList<>();
        predavaci = new ArrayList<>();
        session.getTransaction().begin();
        kreirajOsobe();
        kreirajSmjerove();
        kreirajPolaznike();
        kreirajPredavace();
        kreirajGrupe();
        session.getTransaction().commit();
    }
    
    private void kreirajOsobe() {
        Osoba o;
        
        for(int i = 0; i < BROJ_OSOBA; i++) {
            o = new Osoba();
            o.setIme(faker.name().firstName());
            o.setPrezime(faker.name().lastName());
            o.setOib(faker.idNumber().ssnValid());
            o.setEmail(faker.internet().emailAddress());
            
            session.persist(o);
            osobe.add(o);
        }
        osobeTemp.addAll(osobe);
    }

    private void kreirajSmjerove() {
        Smjer s;
        
        for(int i = 0; i < BROJ_SMJEROVA; i++) {
            s = new Smjer();
            s.setNaziv(faker.beer().name());
            s.setCijena(new BigDecimal(faker.number().numberBetween(910, 1560)));
            s.setUpisnina(new BigDecimal(faker.number().numberBetween(50, 120)));
            s.setTrajanje(faker.number().numberBetween(90, 350));
            s.setVerificiran(faker.bool().bool());
            
            session.persist(s);
            smjerovi.add(s);
        }
    }

    private void kreirajPolaznike() {
        Polaznik p;
        int indexOsoba;
        
        for(int i = 0; i < BROJ_POLAZNIKA; i++) {
            p = new Polaznik();
            indexOsoba = faker.number().numberBetween(0, osobeTemp.size()-1);
            p.setOsoba(osobeTemp.get(indexOsoba));
            osobeTemp.remove(indexOsoba);
            p.setBrojUgovora(faker.business().creditCardNumber());
                        
            session.persist(p);
            polaznici.add(p);
        }
    }

    private void kreirajPredavace() {
        Predavac p;
        int indexOsoba;
        
        for(int i = 0; i < BROJ_PREDAVACA; i++) {
            p = new Predavac();
            indexOsoba = faker.number().numberBetween(0, osobeTemp.size()-1);
            p.setOsoba(osobeTemp.get(indexOsoba));
            osobeTemp.remove(indexOsoba);
            p.setIban(faker.business().creditCardNumber());
                        
            session.persist(p);
            predavaci.add(p);
        }
    }

    private void kreirajGrupe() {
        Grupa g;
        List<Polaznik> p;
        int newPolaznikIndex;
        int currentPolaznikIndex = 0;
        
        for (int i = 0; i < BROJ_GRUPA; i++) {
            g = new Grupa();
            g.setNaziv(faker.color().name());
            g.setDatumPocetka(faker.date().birthday(1, 10));
            g.setPredavac(predavaci.get(faker.number().numberBetween(0, BROJ_PREDAVACA-1)));
            g.setMaxpolaznika(faker.number().numberBetween(5, 30));       
            p = new ArrayList<>();
            
            for (int j = 0; j < faker.number().numberBetween(5, g.getMaxpolaznika()); j++) {                
                while (true) {
                    newPolaznikIndex = faker.number().numberBetween(0, BROJ_POLAZNIKA-1);
                    if (newPolaznikIndex != currentPolaznikIndex) {
                        p.add(polaznici.get(newPolaznikIndex));
                        currentPolaznikIndex = newPolaznikIndex;                    
                        break;
                    }
                }               
            }
            g.setPolaznici(p);
            g.setSmjer(smjerovi.get(faker.number().numberBetween(0, BROJ_SMJEROVA-1)));
            
            session.persist(g);
        }
    }
}
