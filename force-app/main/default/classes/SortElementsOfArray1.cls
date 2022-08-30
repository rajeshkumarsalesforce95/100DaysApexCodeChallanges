/*
*  Author           : Rajesh Kumar @infosys.com
*  Description      : Program to sort the elements of an array in descending order
*  Created Date     : 28-Aug-22
*  LastModifiedDate : 28-Aug-22
*  Change Logs#     : 
*/
public with sharing class SortElementsOfArray1 {
    public SortElementsOfArray1() {
        integer [] arr = new integer [] {5, 2, 8, 7, 1};
        Integer temp;
        String printOriginalArray = '';
        String printSortArray = '';
        System.debug('==== ORIGINAL ARRAY ====');
        for(integer i=0; i<arr.size(); i++){
            printOriginalArray = printOriginalArray + arr[i] + ' '; 
        }
        System.debug(printOriginalArray);
        for(integer i=0; i<arr.size(); i++){
            for(integer j=i+1; j<arr.size(); j++){
                if(arr[i] < arr[j]){
                    temp = arr[i];
                    arr[i]=arr[j];
                    arr[j]=temp;
                }
            }
        }
        System.debug('==== DESCENDING ORDER ARRAY ====');
        for(integer i=0; i<arr.size(); i++){
            printSortArray = printSortArray + arr[i] + ' ';
        }
        System.debug(printSortArray);
    }
}