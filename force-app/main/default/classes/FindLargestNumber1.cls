/*
 * Program to Find Largest of Three Numbers using ternary operator
 */ 
public class FindLargestNumber1 {
    public static void findNumber(integer num1, integer num2, integer num3){
        integer temp = 0;
        temp = (num1>num2)?num1:num2;
        temp = (num3>temp)?num3:temp;
        System.debug(temp + ' is an Largest Number.');
    }
}