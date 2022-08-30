/*
*  Author           : @Rajesh Kumar
*  Description      : Program to print the elements of an array present on odd position
*  Created Date     : 26-Aug-22
*  LastModifiedDate : 26-Aug-22 11:01 AM
*  Change Logs#1    : Logic-1 using if-else condition
*  Change Logs#2    : using only for loop
*/
public with sharing class PrintODDElementsArray {
    public PrintODDElementsArray() {
        integer [] arr = new integer []{9,8,12,65,40,28,20,13,50};
        String printOddElements = '' ;
        /*
        *  Author           : Rajesh Kumar @infosys.com
        *  Description      : Logic-1 using if-else condition
        */
        /*for(integer i=0; i<arr.size(); i++){
            if(i==0){
                printOddElements = printOddElements + arr[i] + ' ';
            }else if(Math.mod(i, 2)==0){
                printOddElements = printOddElements + arr[i] + ' ';
            }
        }*/
        for(integer i=0; i<arr.size(); i=i+2){
            printOddElements = printOddElements + arr[i] + ' ';
        }
        System.debug(printOddElements);
    }
}