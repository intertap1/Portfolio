public class TruthTables {
    public static void main(String[] args) {
        pOrq();
        NOTpOrq();
        NOTpANDqORr();
        NOTpANDqORrOrP();

    }
    public static void pOrq() {
        int[][] truthTableTwo = {{0,0},{0,1},{1,0},{1,1}};
        for (int i = 0; i < truthTableTwo.length; i++) {
            for (int col = 0; col < truthTableTwo[i].length-1; col ++) {
            if ((truthTableTwo[i][col] == 1) || (truthTableTwo[i][col+1] == 1)) {
                IO.println(1);
            }
            else {
                IO.println(0);
            }
            }
        }
    }
    public static void NOTpOrq() {
        int[][] truthTableTwo = {{0,0},{0,1},{1,0},{1,1}};
        for (int i = 0; i < truthTableTwo.length; i++) {
            for (int col = 0; col < truthTableTwo[i].length-1; col ++) {
                if (!(truthTableTwo[i][col] == 1) || (truthTableTwo[i][col+1] == 1)) {
                    IO.println(1);
                }
                else {
                    IO.println(0);
                }
            }
        }
    }
    public static void NOTpANDqORr() {
        int[][] truthTableThree = {{0,0,0},{0,0,1},{0,1,0},{0,1,1},{1,0,0},{1,0,1},{1,1,0},{1,1,1}};
        for (int i = 0; i < truthTableThree.length; i++) {
            for (int col = 0; col < truthTableThree[i].length-2; col ++) {
                if (!(truthTableThree[i][col] == 1 && truthTableThree[i][col+1] == 1) || truthTableThree[i][col+2] == 1) {
                    IO.println(1);
                }
                else {
                    IO.println(0);
                }
            }
        }
    }
    public static void NOTpANDqORrOrP() {
        int[][] truthTableThree = {{0,0,0},{0,0,1},{0,1,0},{0,1,1},{1,0,0},{1,0,1},{1,1,0},{1,1,1}};
        for (int i = 0; i < truthTableThree.length; i++) {
            for (int col = 0; col < truthTableThree[i].length-2; col ++) {
                if (!(truthTableThree[i][col] == 1 && truthTableThree[i][col+1] == 1) || (truthTableThree[i][col+2] == 1 || truthTableThree[i][col] == 1)) {
                    IO.println(1);
                }
                else {
                    IO.println(0);
                }
            }
        }
    }
}