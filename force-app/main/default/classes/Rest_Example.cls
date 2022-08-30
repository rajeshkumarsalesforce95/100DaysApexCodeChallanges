@RestResource(urlMapping='/createAccount/*')
global class Rest_Example {
	@HttpGet
    global static String getData(){
        RestRequest request =RestContext.request;
        Map<String,String> params =request.params;
        String searchText = params.get('Industry');
        List<Account> accounts = [select id,name,Industry from Account WHERE Industry=:searchText];
        System.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        js.writeStringField('Status','Success');
        js.writeNumberField('Count', accounts.size());
        if(accounts.size()>0){
            js.writeFieldName('Accounts');
            js.writeStartArray();
            for(Account acc : accounts){
                js.writeString(acc.name);
            }
            js.writeEndArray();
        }
        js.writeEndObject();
        String result = js.getAsString();
        return result;
        
    }
}