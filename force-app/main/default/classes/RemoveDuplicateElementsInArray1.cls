/*
*  Author           : Rajesh Kumar @infosys.com
*  Description      : Program to remove duplicate element in an Array using Map<> data structure
*  Created Date     : 28/08/2022 11:12 am
*  LastModifiedDate : 28/08/2022 11:12 am
*  Change Logs#     : 
*/
public with sharing class RemoveDuplicateElementsInArray1 {
    public RemoveDuplicateElementsInArray1() {
        Integer [] arrayList = new Integer [] {10,20,20,30,30,40,50,50};
        Map<Integer, boolean> mapElement = new Map<Integer, Boolean>();
        String printArrays = '';
        for(integer i=0; i<arrayList.size(); i++){
            if(!mapElement.containsKey(arrayList[i])){
                mapElement.put(arrayList[i], true);
            }
        }

        printArrays = mapElement.keySet().toString();
        System.debug(printArrays);
    }
}