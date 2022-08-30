/*
 *  Program to Check if a Given Number is Perfect Square using Using sqrt() method
 */ 
public class PerfectSquareExample {
    public static void checkPerfectSQRT(integer num){
        Double sqrt=Math.sqrt(num); 
        if((sqrt - Math.floor(sqrt)) == 0){
            System.debug('Yes, the given number is perfect square.');
        }else{
            System.debug('No, the given number is not perfect square.');
        }
    }
}