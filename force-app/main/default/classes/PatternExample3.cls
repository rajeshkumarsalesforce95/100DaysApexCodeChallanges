/*
      *
      *  *
      *  * *
      *  * * *
      *  * * * *
      *  * * * * * 
      *  * * * * * *
      
 */ 
public class PatternExample3 {
    public static void printPattern(){
        for(integer i=0 ; i<=6; i++){
            string ptn='';
            for(integer j=0; j<=6; j++){
                if(j<=i){
                    ptn = ptn + ' * ';
                }else{
                    
                }
            }
            system.debug(ptn);
        }
    }
}