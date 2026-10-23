import javax.xml.crypto.Data;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        System.out.print(confirmPalindrome());
        System.out.println(Read2DArray());
        System.out.println(displayFullName());
        System.out.println(displayBirthday());
        displayCalculations();
        System.out.println(displayTANotice());
        System.out.println(compareIntegerValues());
    }
    public static String displayFullName() {
        return "Lewis Peart";
    };
    public static int displayBirthday() {
        Scanner birthYearScanner = new Scanner(System.in);
        Scanner currentYearScanner = new Scanner(System.in);
        System.out.println("What is your birth year?");
        int birthYear = birthYearScanner.nextInt();
        System.out.println("What is the current year?");
        int currentYear = currentYearScanner.nextInt();
        return currentYear - birthYear;
    }
    public static void displayCalculations() {
        IO.println(1.3/0);
        IO.println(4/3.0);
        IO.println(117%7);
        IO.println((-1.3)/0);
        IO.println(4-3*5);
        IO.println(0.3-0.2);
        IO.println(0/1.3);
        IO.println(4-(3*5));
        IO.println(0.2-0.1);

        IO.println(10>5);
        IO.println(false || (5!=4));
        IO.println(10==5);
        IO.println(false && (5!=4));
        IO.println(5==5);
        IO.println(!(30 % 3==0));
        IO.println(5==11-6);
        IO.println(0.3-0.2==0.2-0.1);
    }
    public static String displayTANotice() {
        Scanner nameTA = new Scanner(System.in);
        Scanner nameStudent = new Scanner(System.in);
        IO.println("What is the TA's name?");
        String taName = nameTA.nextLine();
        IO.println("What is your name?");
        String studentName = nameStudent.nextLine();
        return "Dear " + taName + "\n" + "I enjoy your tutorials, they are awesome!" + "\n" + studentName + "!";
    }
    public static boolean compareIntegerValues() {
        Scanner valueOneScanner = new Scanner(System.in);
        Scanner valueTwoScanner = new Scanner(System.in);
        Scanner valueThreeScanner = new Scanner(System.in);
        IO.println("Input Value 1");
        int valueOne = valueOneScanner.nextInt();
        IO.println("Input Value 2");
        int valueTwo = valueTwoScanner.nextInt();
        IO.println("Input Value 3");
        int valueThree = valueThreeScanner.nextInt();
        if (valueOne < valueTwo && valueTwo < valueThree) {
            return true;
        }
        return false;
    }
    public static int Read2DArray() {
        int[][] ExcerciseSeven = {{10,20},{30,40},{50,60}};
        Scanner valueOneScanner = new Scanner(System.in);
        Scanner valueTwoScanner = new Scanner(System.in);
        IO.println("Input Value 1");
        int valueOne = valueOneScanner.nextInt();
        IO.println("Input Value 2");
        int valueTwo = valueTwoScanner.nextInt();
        return ExcerciseSeven[valueOne][valueTwo];
    }
    public static boolean confirmPalindrome() {
        boolean palindrome = false;
        Scanner wordScanner = new Scanner(System.in);
        IO.println("Input a word");
        String wordOne = wordScanner.nextLine();
        for (int i = 0; i< wordOne.length(); i++) {
            for (int j = wordOne.length()- 1; j>0; j--) {
                if (Character.toString(wordOne.charAt(i)).equals(Character.toString(wordOne.charAt(j)))) {
                    palindrome = true;
                    IO.println("palindrome = true");
                } else {
                    palindrome = false;
                }
            }
        }
        return palindrome;
    }
}