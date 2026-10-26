
import java.util.*; //allows you to use library code

/**
 * A program working with sets.
 * 
 * @author Jacob Howe
 * @version 30/9/14
 */
public class SetExample
{

    private HashSet<Integer> mySet; //HashSet is one implementation of Sets

    /**
     * Constructor for objects of class SetExample
     */
    public SetExample()
    {
        mySet = new HashSet<Integer>(); //initially empty
    }

    /**
     * Add code that add elements and prints the number of elements
     */
    public void addElementPrint()
    {
        mySet.add(0);
        mySet.add(1);
        /* Add code here to add more elements to my set */
    }
    
    /**
     * Returns the powerset of the field: generates subsets by
     * removing one element at a time
     */
    public HashSet<HashSet<Integer>> powerSet()
    {
        HashSet<HashSet<Integer>> power = new HashSet<>();
        
        HashSet<HashSet<Integer>> tmp1 = new HashSet<>();
        HashSet<HashSet<Integer>> tmp2 = new HashSet<>();
        
        tmp1.add(mySet);
        
        power.add(mySet);
        
        while(!tmp1.isEmpty()) {
            for(HashSet<Integer> s : tmp1) {

                for(Integer i : s) {
                    HashSet<Integer> local = new HashSet<Integer>(s);
                    if(!local.isEmpty()) {
                        local.remove(i);
                        tmp2.add(local);
                    }
                }
            }
            power.addAll(tmp2);
            tmp1 = new HashSet<HashSet<Integer>>(tmp2);
            tmp2.clear();
        }        
        return power;
    }
    
    /**
     * Invokes powerSet() and prints the results
     */
    public void test()
    {
        HashSet<HashSet<Integer>> power = powerSet();
        System.out.println(power.size());
        for(HashSet<Integer> s : power) {
            for(Integer i : s) {
                System.out.print(i + " ");
            }
        }
    }
	
	public static void main()
	{
        SetExample setExample = new SetExample();
        setExample.addElementPrint();	
		setExample.test();
	}
}
