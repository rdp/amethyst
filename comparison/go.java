import java.util.ArrayList;
import java.util.Arrays;

class go {


  static void calcFibN(int num) {
     ArrayList<Integer> fib_array = new ArrayList<Integer>(Arrays.asList(new Integer(0), new Integer(1)));
    for(int i = 0; i < num - 2; i++) {
      //fib_array << (fib_array[i] + fib_array[i+1])
      fib_array.add(fib_array.get(i) + fib_array.get(i+1));
     }
    //System.out.println(fib_array);
  }

  public static void main(String[] args) {
    int a = 1;
    int b = a ^ a;
    
    for(int i = 0; i < 3000000; i++) {
      calcFibN(30);
    }
  }

}