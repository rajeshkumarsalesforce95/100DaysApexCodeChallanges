/*
 * Factorial Program in Apex: Factorial of n is the product of all positive descending integers. Factorial of n is denoted by n!. For example:
 *	4! = 4 X 3 X 2 X 1 = 24  
 *	5! = 5 X 4 X 3 X 2 X 1 = 120   
 * 
 */
public class FactorialExample1 {
    public static Integer result=1;
    public static String  factRes='';
    public static void factorial(integer factNum){
        if(factNum>0){
            result = result * factNum;
            factRes = factRes + factNum + ' X ';
            factorial(factNum-1);
        }
        if(factNum==0){ 
            factRes = factRes.removeEnd(' X '); 
            SYstem.debug(factRes + ' = '+ result);
        }
        
    }
}