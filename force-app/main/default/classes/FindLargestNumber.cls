/*
 * Program to Find Largest of Three Numbers using if-else condition
 */ 
public class FindLargestNumber {
    public static void findNumber(integer num1, integer num2, integer num3){
        if(num1>num2 && num1>num3){
            System.debug(num1 + ' is an Largest Number.');
        }else if(num2>num3 && num2>num1){
            System.debug(num2 + ' is an Largest Number.');
        }else{
            System.debug(num3 + ' is an Largest Number.');
        }
    }
}