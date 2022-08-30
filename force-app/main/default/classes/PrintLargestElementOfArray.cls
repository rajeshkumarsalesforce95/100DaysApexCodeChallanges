/*
*  Author           : Rajesh Kumar @infosys.com
*  Description      : Program to print the largest element in an array
*  Created Date     : 26-Aug-22
*  LastModifiedDate : 26-Aug-22 11:55 AM
*  Change Logs#     : 
*/
public with sharing class PrintLargestElementOfArray {
    public PrintLargestElementOfArray() {
        integer [] arr = new integer []{2,1,5,4,3,8,9};
        integer maxNumber = arr[0];
        for(integer i=1; i<arr.size(); i++){
            if(maxNumber < arr[i]){
                maxNumber = arr[i];
            }
        }
        System.debug(maxNumber);
    }
}