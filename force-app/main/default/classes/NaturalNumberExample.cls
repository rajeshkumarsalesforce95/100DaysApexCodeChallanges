/*
 *  Program to Find Sum of Natural Numbers
 *  Sum of n natural numbers= n*(n+1)/2
 */ 
public class NaturalNumberExample {
    public static void findNaturalNum(integer num){
        Integer sum = 0;
        for(integer i=0; i<=num; i++){
            sum = sum + i;
        }
        System.debug('Sum of Natural Number : ' + sum); // n*(n+1)/2
    }
}