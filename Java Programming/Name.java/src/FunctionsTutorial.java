public class FunctionsTutorial {
    public static void main(String[] args) {
        // excercise8();
        //excercise11(8);
        excercise14(15,9);
    }
    static void excercise8() {
        IO.println(Math.floor(0.3));
        IO.println(Math.ceil(-0.1));
        IO.println(Math.floor(-0.5));
        IO.println((int) -0.1);
        IO.println((int) -1.2);
        IO.println(Math.abs(-0.6));
        IO.println(23 % 7);
        IO.println(25 % 5);
        IO.println(-35 % 11);
        IO.println((9+12) % 13);
        IO.println((1+4) % 13);
        IO.println((6+7) % 13);
    }
    static void excercise11(int n) {
        int value1 = 0;
        int value2 = 1;
        int value3 = 0;
        for (int i = 0; i <= n-1; i++) {
             value3 = value1 + value2;
             value1 = value2;
             value2 = value3;
        }
        IO.println(value3);
    }
    static void excercise14(int x1,int x2) {
        int value1 = x1;
        int value2 = x2;
        if (value2 != 0) {
            value1 = value1 % value2;
            excercise14(value2,value1);
        }
        else {
            IO.println("gcd(" + value1 + "," + value2 + ")");
        }
    }
}
