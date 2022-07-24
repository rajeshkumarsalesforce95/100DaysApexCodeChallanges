public class JSON_Example1 {
    public String jsonString {set;get;}
    
    public JSON_Example1(){
        System.JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
           gen.writeFieldName('Name');
           gen.writeString('Wipro');
           gen.writeStringField('City','Bhinmal');
           gen.writeFieldName('Age');
           gen.writeNumber(30);
           gen.writeNumberField('Amount',1000); 
           Blob b = Blob.valueOf('Innovex');
           gen.writeBlobField('Password',b);
        gen.writeEndObject();
        jsonString = gen.getAsString();
    }

}