/*
*   Author           : Rajesh Kumar
*   Description      : Program to subtract two matrices
*   Created Date     : 30/08/2022
*   LastModifiedDate : 30/08/2022
*   Change Logs#     : 
*/
public with sharing class MatrixSubtractionExample {
    public MatrixSubtractionExample() {
        /*
           TODOs : 1st Matrix
        */
        List<Integer> arrayList1 = new List<Integer>{4,5,6};
        List<Integer> arrayList2 = new List<Integer>{3,4,1};
        List<Integer> arrayList3 = new List<Integer>{1,2,3};
        List<List<Integer>> matrix1 = new List<List<Integer>>{arrayList1, arrayList2, arrayList3};
        /*
           TODOs : 2nd Matrix
        */
        List<Integer> arrayList11 = new List<Integer>{2,0,3};
        List<Integer> arrayList22 = new List<Integer>{2,3,1};
        List<Integer> arrayList33 = new List<Integer>{1,1,1};
        List<List<Integer>> matrix2 = new List<List<Integer>>{arrayList11, arrayList22, arrayList33};
        /*
           TODOs : 3rd Matrix
        */
        List<List<Integer>> matrix3 = new List<List<Integer>>();
        List<Integer> addArrayList = new List<Integer>();
        for(Integer i=0; i<3; i++){
            for(Integer j=0; j<3; j++){
                addArrayList.add(matrix1[i][j] - matrix2[i][j]);
            }
            matrix3.add(addArrayList);
            System.debug(matrix3);
            addArrayList.clear();
        }
        
    }
}