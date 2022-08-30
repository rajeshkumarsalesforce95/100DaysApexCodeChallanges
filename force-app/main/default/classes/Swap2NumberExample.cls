/*
 * Program to Swap Two Numbers Using Bitwise Operator
 * 
 */ 
public class Swap2NumberExample {
    public static void swapNum(integer num1, integer num2){
        System.debug('Before swapping: ');
        System.debug('num1 = ' +num1 +', num2 = ' +num2);
        num1 = num1 ^ num2;
        num2 = num1 ^ num2;
        num1 = num1 ^ num2;
        System.debug('After swapping: ');
        System.debug('num1 = ' +num1 +', num2 = ' +num2);
    }
}