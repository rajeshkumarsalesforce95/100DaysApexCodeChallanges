/*
     * * * * *
     * * * * *
     * * * * *
     * * * * *
     * * * * *
     * * * * * 
 */ 
public class PatternExample1 {
    public static void printPattern(){
        for(integer i=0; i<6; i++){
            String star = '';
            for(integer j=0; j<5; j++){
                star = star + '  *  ';
            }
            System.debug(star); 
        }
        
    }
}