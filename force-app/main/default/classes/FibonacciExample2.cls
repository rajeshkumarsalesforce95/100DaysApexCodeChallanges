/* 
 * In fibonacci series, next number is the sum of previous two numbers for example= 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 etc. 
 * The first two numbers of fibonacci series are 0 and 1.
 * 
 * Fibonacci Series in Apex using recursion
 */
public class FibonacciExample2 {
    public static Integer num1 =0 ;
    public static Integer num2 =1 ;
    public static Integer num3;
    public static String result = '';
    public static Integer num1Copy = num1;
    public static Integer num2Copy = num2;
    public static void printFibonacci(Integer count){
        if(count>0){
            num3 = num1 + num2;                           
            num1 = num2;    
            num2 = num3;
            result = result + ' ' + num3;
            printFibonacci(count-1);
        }
        if(count==0){
            System.debug(num1Copy + ' ' + num2Copy +result);
        }
        
    }
}