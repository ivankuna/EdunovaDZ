package org.example;

import java.util.Scanner;

public class CiklicnaMatrica {

    public static void ispisMatrice(int rows, int columns, int[][] matrica) {
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                System.out.print(matrica[i][j] + "\t");
            }
            System.out.println();
        }
    }

    public static void cicklicnaMatrica(Scanner scanner) {
        System.out.print("Unesite broj redova: ");
        int rows = scanner.nextInt();
        System.out.print("Unesite broj stupaca: ");
        int columns = scanner.nextInt();

        int[][] matrica = new int[rows][columns];

        int brojac = 1;

        int leftY = 0;
        int jCounter = 2;
        int jBuffer = 0;

        int leftX = 0;
        int kCounter = 1;
        int kBuffer = 0;

        int rightY = columns - 1;
        int lCounter = 1;
        int lBuffer = 1;

        int rightX = rows - 2;
        int mCounter = columns - 2;
        int mBuffer = 0;

        for (int i = 1; i <= columns; i++) {
            matrica[rows - 1][columns - i] = brojac++;
        }

        while (brojac <= (rows * columns)) {
            for (int j = jCounter; j <= (rows - jBuffer); j++) {
                matrica[rows - j][leftY] = brojac++;
            }
            leftY += 1;
            jCounter += 1;
            jBuffer += 1;

            for (int k = kCounter; k < (columns - kBuffer); k++) {
                matrica[leftX][k] = brojac++;
            }
            leftX += 1;
            kCounter += 1;
            kBuffer += 1;

            for (int l = lCounter; l < (rows - lBuffer); l++) {
                matrica[l][rightY] = brojac++;
            }
            rightY -= 1;
            lCounter += 1;
            lBuffer += 1;

            for (int m = mCounter; m > mBuffer; m--) {
                matrica[rightX][m] = brojac++;
            }
            rightX -= 1;
            mCounter -= 1;
            mBuffer += 1;
        }
        ispisMatrice(rows,columns,matrica);
    }
}
