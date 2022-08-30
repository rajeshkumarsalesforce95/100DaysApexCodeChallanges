/*
 * A positive integer n is called a sphenic number if the product of factors of the given number (n) is exactly three and all factors are prime. 
 * In other words, if n is a sphenic integer then n=p x q x r (p, q, and are three distinct prime numbers and their product are n).
 * 
 */ 
public class SphenicNumberExample {
    public static void checkSphenicNumber(integer num){
        boolean value = isSphenicNumber(num); 
        system.debug('');
    }
    public static boolean isSphenicNumber(integer num){
        integer temp = num;
        List<Integer> digits = new List<Integer>();
        for(integer i=1; i<=num; i++){
            if(Math.mod(num, i)==0){
                digits.add(i);
            }
        }
        System.debug('digits=' +digits);
        
        return true;
    }
}