/*
*  Author           : Rajesh Kumar @infosys.com
*  Description      : Program to Find Smallest Number in an array
*  Created Date     : 27/08/2022 11:12 am
*  LastModifiedDate : 27/08/2022 11:12 am
*  Change Logs#     : 
*/
public with sharing class PrintSmallestNumberInArray {
    public PrintSmallestNumberInArray() {
        List<Integer> arrList = new List<Integer>{44,66,99,77,33,22,55};
        arrList.sort();
        system.debug('Smallest Number :: ' + arrList.get((arrList.size()-1)-(arrList.size()-1)));
    }
}