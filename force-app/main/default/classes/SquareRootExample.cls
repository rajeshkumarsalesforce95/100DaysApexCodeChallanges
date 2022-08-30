/*
 * Program to Find Square Root of a Number Without sqrt Method
 */ 
public class SquareRootExample {
    public static void findSqrtRoot(integer num){
        Decimal sqrtroot = num/2;
        Decimal temp;
        do{
          temp = sqrtroot;
          sqrtroot=(temp+(num/temp))/2;  
        }
        while((temp-sqrtroot)!= 0);
        
        System.debug('SQRT ROOT :: ' + (Integer)sqrtroot);
    }
}