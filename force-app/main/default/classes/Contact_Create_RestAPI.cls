@RestResource(urlMapping='/createContact/*')
global class Contact_Create_RestAPI {
	@HttpPost
    global static String createContact(String lastname, String firstname, String phone){
        System.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        try{
            Contact con = new Contact();
            con.LastName = lastname;
            con.FirstName =firstname;
            con.Phone = phone;
            insert con;
            js.writeStringField('Status', 'Success');
            js.writeIdField('id',con.id);
        }catch(Exception ex){
            js.writeStringField('Status', 'Failed');
            js.writeStringField('Error', ex.getTypeName());
        }
        
        js.writeEndObject();
        String result = js.getAsString();
        return result;
    }
    
    @HttpGet
    global static String create(){
        RestRequest request = RestContext.request;
        Map<String,String> inputs = request.params;
        String lastname = inputs.get('lastname');
        String firstname = inputs.get('firstname');
        String phone = inputs.get('phone');
        
        System.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        try{
            Contact con = new Contact();
            con.LastName = lastname;
            con.FirstName =firstname;
            con.Phone = phone;
            insert con;
            js.writeStringField('Status', 'Success');
            js.writeIdField('id',con.id);
        }catch(Exception ex){
            js.writeStringField('Status', 'Failed');
            js.writeStringField('Error', ex.getTypeName());
        }
        
        js.writeEndObject();
        String result = js.getAsString();
        return result;
    }
}