public class JSON_Example3 {
    public string searchText {set;get;} 
    public string result    {set;get;}
    
    public void searchMethod(){
        List<Account> accList = [select id,name,phone,rating,Industry from Account WHERE Industry=:searchText];
        System.JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
            Integer count =accList.size();
            gen.writeStringField('Status','Success');
            gen.writeNumberField('Count',count);
            if(count>0){
                gen.writeFieldName('Accounts');
                gen.writestartArray();
                    for(Account acc : accList){
                        gen.writeStartObject();
                            gen.writeStringField('Name',acc.name);
                            gen.writeStringField('Phone',acc.phone);
                            gen.writeStringField('Rating',acc.rating);
                            gen.writeStringField('Industry',acc.Industry);
                        gen.writeEndObject();
                    }
                gen.writeEndArray();
            }
        gen.writeEndObject();
        
        result = gen.getAsString();
        //result = JSON.serialize(result, true);
    }
}