/* 
 * In fibonacci series, next number is the sum of previous two numbers for example= 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 etc. 
 * The first two numbers of fibonacci series are 0 and 1.
 * 
 * Fibonacci Series in Apex without using recursion
 */
public class FibonacciExample1 {
    public static void getFibonacci(){
        Integer num1 =0 ;
        Integer num2 =1 ;
        Integer num3;
        String result=''; 
        Integer [] arr = new Integer[15];
        Integer num1Copy = num1;
        Integer num2Copy = num2;
        
        for(integer i=2; i<arr.size(); ++i){
            num3 = num1 + num2;
            result = result + ' ' + num3;                             
            num1 = num2;    
            num2 = num3; 
        }
        System.debug(num1Copy + ' ' + num2Copy +result);
    }
}