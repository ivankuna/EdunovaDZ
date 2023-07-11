package org.example;

public class LjubavniKalkulator {
    public static void start(String firstName, String secondName) {
        StringBuilder percentage = new StringBuilder();

        int[] result = letterCount(strToField(firstName, secondName));
        
        result = ljubavniKalkulator(result);

        for (int e : result) {
            percentage.append(e);
        }

        System.out.println(firstName + " i " + secondName + " se vole " + percentage + "%");
    }
    // Metoda "strToField" od pohranjenih imena vraća String[] koje sadrži oba spomenuta
    public static String[] strToField(String firstName, String secondName) {
        int nameLen = firstName.length() + secondName.length();
        String[] nameField;

        if (nameLen % 2 == 0) {
            nameField = new String[nameLen];
        } else {
            nameField = new String[nameLen + 1];
        }

        String imeTemp = (nameLen % 2 == 0) ? firstName + secondName : firstName + " " + secondName;

        for (int i = 0; i < imeTemp.length(); i++) {
            nameField[i] = String.valueOf(imeTemp.charAt(i));
        }
        return nameField;
    }
    // Metoda "letterCount" broji ponavljanje pojedinih slova te vraća niz koji predstavlja ista ponavljanja
    public static int[] letterCount(String[] nameField) {
        int letterCount = 0;
        int loopCount = 0;

        int[] countField = new int[nameField.length];

        for (String firstNameLetter : nameField) {
            for (String secondNameLetter : nameField) {
                if (firstNameLetter.equals(secondNameLetter)) {
                    letterCount+=1;
                }
            }
            if(firstNameLetter.equals(" ")) {
                countField[loopCount] = 0;
            } else {
                countField[loopCount] = letterCount;
            }
            letterCount = 0;
            loopCount++;
        }
        return countField;
    }

    public static int[] ljubavniKalkulator(int[] tempCountField) {
        int[] tempRes = new int[tempCountField.length / 2];
        int buffer = tempCountField.length - 1;
        boolean doubleDigit = false;
        int[] tempResDoubleDigit;
        int[] tempResOdd;
        StringBuilder stringBuilder;

        // Zbrajanje prve i zadnje vrijednosti pohranjenih u nizu integer-a
        for (int i = 0; i < tempCountField.length / 2; i++) {
            tempRes[i] = tempCountField[i] + tempCountField[buffer];
            buffer--;
        }
        // Provjera dvoznamenkastih brojeva
        for (int e : tempRes) {
            if (e > 9) {
                doubleDigit = true;
            }
        }
        // U slučaju da postoji dvoznamenkasti broj, isti se dijeli na dva jednoznamenkasta broja
        if (doubleDigit) {
            stringBuilder = new StringBuilder();
            tempResDoubleDigit = new int[tempRes.length + 1];
            for (int e : tempRes) {
                stringBuilder.append(e);
            }
            for (int j = 0; j < stringBuilder.length(); j++) {
                tempResDoubleDigit[j] = Integer.parseInt(String.valueOf(stringBuilder.charAt(j)));
            }
            tempRes = tempResDoubleDigit;
        }
        // Provjera dužine niza, u slučaju ako je int[].length neparan, dodaje se nula na prikladno mjesto
        if (tempRes.length % 2 != 0) {
            tempResOdd = new int[tempRes.length + 1];
            int counter = 0;
            for (int i = 0; i < tempResOdd.length; i++) {
                if (i == ((int) Math.ceil(1.0 * tempRes.length / 2))) {
                    tempResOdd[i] = 0;
                } else {
                    tempResOdd[i] = tempRes[counter];
                    counter++;
                }
            }
            tempRes = tempResOdd;
        }
        if (tempRes.length < 3) {
            return tempRes;
        } else {
            return ljubavniKalkulator(tempRes);
        }
    }
}
