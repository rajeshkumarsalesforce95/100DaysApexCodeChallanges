public class Future_Schedule_CallOut_Example {
    @future(callout=true)
    public static void show(String apiKey){
         Decimal inrValue;
         List<Currency_Layer_Tracker__c> currencyListUpdate = new List<Currency_Layer_Tracker__c>();
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
        
        Currency_Layer_Tracker__c currencyVal = new Currency_Layer_Tracker__c();
        insert currencyVal;
        List<Currency_Layer_Tracker__c> currencyList= [select id,name,Start_Value__c from Currency_Layer_Tracker__c WHERE id=:currencyVal.id];
        for(Currency_Layer_Tracker__c con : currencyList){
            inrValue = Math.round(inrValue * 100) / 100.0;
            con.Start_Value__c = inrValue+' Indian Rupee'; 
            currencyListUpdate.add(con);
        }
        
        if(currencyListUpdate.size()>0){
           update currencyListUpdate; 
        }
        

    }

}