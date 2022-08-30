/*
 * Program to find the frequency of each element in the array
 */ 
public class ArrayExample1 {
    public static void arrayFrequency(){
        integer [] arr = new integer[]{1, 2, 8, 3, 2, 2, 2, 5, 1};
        integer [] frequency = new integer [arr.size()]; 
        integer visited = -1;
        for(integer i=0; i<arr.size(); i++){
            integer count = 1;
            for(integer j= i+1; j<arr.size(); j++){
                if(arr[i] == arr[j]){
                    count++;
                    frequency[j] = visited;  
                }
            }
            if(frequency[i] != visited){
                frequency[i] = count;  
            }
        }
        
        //Displays the frequency of each element present in array
        System.debug(' Element  |  Frequency');   
        for(integer i=0; i<frequency.size(); i++){
            if(frequency[i] != visited){
                System.debug('   ' + arr[i] + '     |    '  + frequency[i]);   
            }
        }
        
        
    }
}