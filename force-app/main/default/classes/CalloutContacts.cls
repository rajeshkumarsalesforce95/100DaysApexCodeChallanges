public class CalloutContacts {
    public void createContact(){
        List<Contact> conListInsert = new List<Contact>();
        Http hp = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.capitalinfosol.com/create');
        request.setMethod('GET');
        HttpResponse response = hp.send(request);
        String jsonString = response.getBody();
        System.JSONParser jp = JSON.createParser(jsonString);
        Contact con = new Contact();
        while(jp.nextToken()!=null){
            if(jp.getText()=='lastName'){
                jp.nextToken();
                con.LastName=jp.getText();
            }
            if(jp.getText()=='firstName'){
                jp.nextToken();
                con.FirstName = jp.getText();
            }
            if(jp.getText()=='phone'){
                jp.nextToken();
                con.Phone = jp.getText();
            }
            
            //conListInsert.add(con);
        }
        
        insert con;
        
        /*if(conListInsert.size()>0){
            insert conListInsert;
        }*/
    }
}