/* Convert $ dollar to INR Ruppee using the Job*/
global class Opty_Currency_UpdateJob implements Database.Batchable<sObject>, Database.AllowsCallouts{
    global String apiKey;
    global Opty_Currency_UpdateJob(String apiKey){
        this.apiKey = apiKey;
    }
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'Select id,Amount,name,INR__c from Opportunity';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Opportunity> scope){
        Decimal inrValue; 
        Http hp = new Http();
         HttpRequest request = new HttpRequest();
         String endPoint ='http://api.currencylayer.com/live?';
         endPoint = endPoint+'access_key='+apiKey;
         endPoint = endPoint+'&currencies=INR&source=USD&format=1';
         request.setEndpoint(endpoint);
         request.setMethod('GET');
         HttpResponse response = hp.send(request);
         String jsonString = response.getBody();
         System.JSONParser jp = JSON.createParser(jsonString);
         While(jp.nextToken()!=null){
             if(jp.getText()=='USDINR'){
                 jp.nextToken();
                 inrValue = (Decimal)jp.getDecimalValue();
             }
        }
        
        for(Opportunity op : scope){
            op.INR__c = 'Rs. '+(op.amount*inrValue);
        }
        
        if(scope.size()>0){
            update scope;
        }
    }
    
    global void finish(Database.BatchableContext bc){
        AsyncApexJob job = [Select id,Status from AsyncApexJob WHERE Id=:bc.getJobId()];
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        String [] toaddress = new String []{'rajesh.salesforce95@gmail.com'};
        msg.setToAddresses(toaddress);
        msg.setSubject('Status Updated');
        msg.setPlainTextBody('Batch Operation Processed : ' + job.Status);
        Messaging.Email [] emails = new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
    }
}