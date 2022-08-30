/*
*  Author           : Rajesh Kumar @infosys.com
*  Description      : Program to remove duplicate element in an Array
*  Created Date     : 28/08/2022 11:12 am
*  LastModifiedDate : 28/08/2022 11:12 am
*  Change Logs#     : 
*/
public with sharing class RemoveDuplicateElementsInArray {
    public RemoveDuplicateElementsInArray() {
        Integer [] arrays = new Integer [] {10,20,20,30,30,40,50,50};
        integer [] tempArray = new Integer [arrays.size()];
        String printNewArrays = '';
        String printOldArrays = '';
        Integer j = 0;
        System.debug('===== ORIGINAL ARRAY =====');
        for(Integer i=0; i<arrays.size(); i++){
            printOldArrays = printOldArrays + arrays[i] + ' ';
        }
        System.debug(printOldArrays);

        for(Integer i=0; i<arrays.size()-1; i++){
            if(arrays[i] != arrays[i+1]){
                tempArray[j++] = arrays[i];
            }
        }
        tempArray[j++] = arrays[arrays.size()-1];
        for(Integer i=0; i<j; i++){
            arrays[i] = tempArray[i];
        }

        System.debug('===== AFTER REMOVE DUPLICATE ARRAY =====');
        for(Integer i=0; i<j; i++){
            printNewArrays = printNewArrays + arrays[i] + ' ';
        }
        System.debug(printNewArrays);
    }
}