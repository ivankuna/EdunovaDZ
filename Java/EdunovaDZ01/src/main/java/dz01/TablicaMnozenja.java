package dz01;

import java.util.Scanner;

public class TablicaMnozenja {
    public static int duzinaRetka = 31;
    public static void ispisOdlomka() {
        for(int i = 0; i <= duzinaRetka - 1; i++) {
            System.out.print("-");
        }
        System.out.println();
    }
    public static void ispisZaglavlja() {
        ispisOdlomka();
        System.out.println(": : :  TABLICA  MNOZENJA  : : :");
        ispisOdlomka();
    }
    public static void ispisImena(String ime) {
        String uzorak = ":  ";
        int slobodnoMjesto = duzinaRetka - (ime.length() + 4); // 4 predstavlja mjesto koje zauzima String "by: "
        int uzorakBrojac = slobodnoMjesto / uzorak.length();

        ispisOdlomka();

        for (int i = 0; i < uzorakBrojac; i++) {
            System.out.print(uzorak);
        }
        for (int j = 0; j < (slobodnoMjesto - (uzorakBrojac * uzorak.length())); j++) {
            System.out.print(" ");
        }
        System.out.print("By: " + ime+ "\n");

        ispisOdlomka();
    }
    public static void ispisTabliceMnozenja(Scanner scanner) {
        System.out.print("Unesite ime:");
        String ime = scanner.nextLine().trim();
        ispisZaglavlja();
        System.out.print(" * |");
        for (int i = 1; i < 10; i++) {
            System.out.print("  " + i);
        }
        System.out.println();
        ispisOdlomka();

        for(int i = 1; i < 10; i++ ) {
            System.out.print(" " + i + " |");
            for(int j = 1; j < 10; j++) {
                int k = j * i;
                int brojZnamenaka = Integer.toString(k).length();
                System.out.print((brojZnamenaka > 1 ? " " : "  ") + j * i);
            }
            System.out.println();
        }
        ispisImena(ime);
    }
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ispisTabliceMnozenja(scanner);
    }
}