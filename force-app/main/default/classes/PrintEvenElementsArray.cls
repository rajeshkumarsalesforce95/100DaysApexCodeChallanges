/*
*  Author           : @Rajesh Kumar
*  Description      : Program to print the elements of an array present on even position
*  Created Date     : 26-Aug-2022
*  LastModifiedDate : 26-Aug-2022 09:30 AM
*  Change Logs#     : 
*/
public class PrintEvenElementsArray {
    public static void PrintEvenElement() {
        integer [] arr = new integer []{9,8,12,65,40,28,20};
        String printArray = '';
        for(integer i=1; i<arr.size(); i=i+2){
            printArray = printArray + arr[i] + ' ';
        }
        system.debug(printArray);

    }
}