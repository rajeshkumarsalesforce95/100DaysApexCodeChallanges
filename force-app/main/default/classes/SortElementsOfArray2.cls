/*
*  Author           : Rajesh Kumar @infosys.com
*  Description      : Program to sort the elements of an array in ascending order using List Sort();
*  Created Date     : 28-Aug-22
*  LastModifiedDate : 28-Aug-22
*  Change Logs#     : 
*/
public with sharing class SortElementsOfArray2 {
    public SortElementsOfArray2() {
        List<integer> arrList = new List<integer>{5, 2, 8, 7, 1};
        arrList.sort();
        String printArray = '';
        for(integer i=0; i<arrList.size(); i++){
            printArray = printArray + arrList.get(i) + ' ';
        }
        System.debug(printArray);
    }
}