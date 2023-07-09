package org.example;

import java.util.Scanner;

import static org.example.LjubavniKalkulator.ljubavniKalkulator;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Unesite vaše ime: ");
        String firstName = scanner.nextLine();
        System.out.print("Unesite ime vašeg partnera: ");
        String secondName = scanner.nextLine();

        ljubavniKalkulator(firstName, secondName);
    }
}