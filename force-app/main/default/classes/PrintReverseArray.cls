/*
 * Program to print the elements of an array in reverse order
 */ 
public class PrintReverseArray {
    public static void printArray(){
        integer [] arr = new integer[]{1,2,3,4,5,8,23,26};
        String printReverseArray = '';
        for(integer i=1; i<=arr.size(); i++){
            printReverseArray = printReverseArray + arr[arr.size()-i]+ ' ';
        }
        System.debug(printReverseArray);   
    }
}