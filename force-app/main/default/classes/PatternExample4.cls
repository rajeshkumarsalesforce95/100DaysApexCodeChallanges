/*
                   *
                 * *
               * * *
             * * * *
           * * * * * 
        * * * *  * *
      * * * * *  * *
      
 */ 
public class PatternExample4 {
	public static void printPattern(){
        for(integer i=1 ; i<=6; i++){
            string ptn=' ';
            for(integer j=1; j<=6; j++){ 
                if(j>=7-i){
                    ptn = ptn + ' * ';
                }else{
                    ptn = ptn + ' - '; 
                }
            }
            system.debug(ptn);
        }
    }
}