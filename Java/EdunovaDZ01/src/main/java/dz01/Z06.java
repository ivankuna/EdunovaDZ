package dz01;

import java.util.Scanner;

public class Z06 {
    public static void unosBroja(Scanner scanner) {
        System.out.print("Unesite broj između 1 i 999: ");
        int broj = scanner.nextInt();
        scanner.nextLine();

        if (broj < 1 || broj > 999) {
            System.out.println("Neispravan unos!");
            // prekid programa...
        } else {
            String tempBrojHolder = Integer.toString(broj);
            String[] brojHolder = new String[tempBrojHolder.length()];
            for (int i = 0; i < tempBrojHolder.length(); i++) {
                brojHolder[i] = String.valueOf(tempBrojHolder.charAt(i));
            }
            System.out.println("Prva znamenka unešenog broja je: " + brojHolder[0]);
        }
    }

    public static void unosDvaBroja(Scanner scanner) {
        System.out.print("Unesite prvi broj: ");
        int prviUnos = scanner.nextInt();
        scanner.nextLine();
        System.out.print("Unesite drugi broj: ");
        int drugiUnos = scanner.nextInt();
        scanner.nextLine();

        if (prviUnos % 2 == 0 && drugiUnos % 2 == 0) {
            System.out.println("Zbroj dvaju unešenih brojeva iznosi: " + (prviUnos + drugiUnos));
        } else {
            System.out.println("Razlika dvaju unešenih brojeva iznosi: " + (prviUnos - drugiUnos));
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        odabir:
        while (true) {
            System.out.println("Unos broja (1)\n" +
                    "Unos dva broja (2)\n" +
                    "Izlaz iz programa (0)");
            System.out.print("Unesite odgovarajuću brojku kako bi pristupili određenom zadatku: ");
            String odabirPrograma = scanner.nextLine();
            switch (odabirPrograma) {
                case "1":
                    unosBroja(scanner);
                    break;
                case "2":
                    unosDvaBroja(scanner);
                    break;
                case "0":
                    break odabir;
                default:
                    System.out.println("Neispravan unos!");
            }
        }
    }
}
