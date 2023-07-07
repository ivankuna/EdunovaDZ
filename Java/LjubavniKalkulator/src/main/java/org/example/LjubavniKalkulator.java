package org.example;

import java.util.Scanner;

public class LjubavniKalkulator {
    public static void ljubavniKalk(Scanner scanner) {
        System.out.print("Unesite vaše ime: ");
        String vlastitoIme = scanner.nextLine();
        System.out.print("Unesite ime vašeg partnera: ");
        String imePartnera = scanner.nextLine();

        int[] kolicinaSlova = brojacSlova(strToField(vlastitoIme, imePartnera));
        int offset = 2;
        int[] rezultat = new int[kolicinaSlova.length];
        while (rezultat.length > 2) {
            rezultat = new int[kolicinaSlova.length - offset];
            for (int i = 0; i < kolicinaSlova.length / 2; i++) {

            }

        }



        for (int e : kolicinaSlova) {
            System.out.print(e);
        }
    }
    public static String[] strToField(String vlastitoIme, String imePartnera) {
        int zbrojDuzineImena = vlastitoIme.length() + imePartnera.length();
        String[] nizImena;

        if (zbrojDuzineImena % 2 == 0) {
            nizImena = new String[zbrojDuzineImena];
        } else {
            nizImena = new String[zbrojDuzineImena + 1];
        }

        String imeTemp = (zbrojDuzineImena % 2 == 0) ? vlastitoIme + imePartnera : vlastitoIme + " " + imePartnera;
        for (int i = 0; i < imeTemp.length(); i++) {
            nizImena[i] = String.valueOf(imeTemp.charAt(i));
        }
        return nizImena;
    }
    public static int[] brojacSlova(String[] nizImena) {
        int brojacSlova = 0;
        int brojacPonavljanja = 0;

        int[] kolicinaSlovaTemp = new int[nizImena.length];

        for (String slovoVlastitoIme : nizImena) {
            for (String slovoImePartnera : nizImena) {
                if (slovoVlastitoIme.equals(slovoImePartnera)) {
                    brojacSlova+=1;
                }
            }
            if(slovoVlastitoIme.equals(" ")) {
                kolicinaSlovaTemp[brojacPonavljanja] = 0;
            } else {
                kolicinaSlovaTemp[brojacPonavljanja] = brojacSlova;
            }
            brojacSlova = 0;
            brojacPonavljanja++;
        }
        return kolicinaSlovaTemp;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ljubavniKalk(scanner);
    }
}
