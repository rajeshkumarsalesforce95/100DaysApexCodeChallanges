/*
 * Program to Find Smallest of Three Numbers using if-else condition
 */
public class FindSmallestNumber {
	public static void findNumber(integer num1, integer num2, integer num3){
        if(num1<num2 && num1<num3){
            System.debug(num1 + ' is an Smallest Number.');
        }else if(num2<num3 && num2<num1){
            System.debug(num2 + ' is an Smallest Number.');
        }else{
            System.debug(num3 + ' is an Smallest Number.');
        }
    }
}