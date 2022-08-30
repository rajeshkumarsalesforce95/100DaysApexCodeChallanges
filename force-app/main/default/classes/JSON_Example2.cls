public class JSON_Example2 {
    public Account acc {set;get;}
    public String result {set;get;}
    
    public JSON_Example2(){
        acc = new Account();
    }

    public void createAccount(){
        System.JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeFieldName('Status');
        try{
            insert acc;
            gen.writeString('Success');
            gen.writeIdField('Id',acc.id);
        }catch(Exception ex){
            gen.writeString('Failed');
            gen.writeStringField('ERROR',ex.getMessage());
        }
        gen.writeEndObject();
        result = gen.getAsString();
    }
}