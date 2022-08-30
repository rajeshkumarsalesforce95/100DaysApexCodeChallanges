public class Schedule_Callout_Example implements Schedulable{
    public String apiKey;
    public Schedule_Callout_Example(String apiKey){
        this.apiKey = apiKey;
    }
    
    public void execute(SchedulableContext sc){ 
        
        Future_Schedule_CallOut_Example.show(apiKey);
    }

}