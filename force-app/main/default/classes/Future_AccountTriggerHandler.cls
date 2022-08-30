public class Future_AccountTriggerHandler {
    @future(callout=true)
    public static void invoke(Set<Id> accIds){
        List<Account> accList = [select id,name,City_Name__c,Postal_Code_Zip_Code__c,BillingCity from Account WHERE Id IN :accIds];
        for(Account acc : accList){
            String endPoint = 'https://api.postalpincode.in/postoffice/'+acc.BillingCity;
            Http hp = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            HttpResponse response = hp.send(request);
            String result = response.getBody();
            
            System.JSONParser jp = JSON.createParser(result);
        	while(jp.nextToken()!=null){
                if(jp.getText()=='PINCode'){
                    jp.nextToken();
                    String pincode = jp.getText();
                    acc.Postal_Code_Zip_Code__c = pincode;
                }
        	}
            
        }
        
        update accList;
    }
}