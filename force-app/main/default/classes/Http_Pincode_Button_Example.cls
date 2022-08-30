/* EndPoint : https://api.postalpincode.in/postoffice/Jalore Coll
 * Method   : GET
 * Response : Json
 */
global class Http_Pincode_Button_Example {
    public static String pincode;
    public static String result;
    webservice static String getInvoke(String accId){
        Account acc = [select id,name,BillingCity,Postal_Code_Zip_Code__c from Account WHERE id=:accId]; 
        if(acc.BillingCity!=null && !acc.BillingCity.contains(' ')){
           String endPoint = 'https://api.postalpincode.in/postoffice/'+acc.BillingCity; 
           
            Http hp = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            HttpResponse response = hp.send(request);
            result = response.getBody();
            System.debug('Result==' +result);
            System.JSONParser jp = JSON.createParser(result);
            while(jp.nextToken()!=null){
                if(jp.getText()=='PINCode'){
                    jp.nextToken();
                    pincode = jp.getText();
                    System.debug('pincode==' +pincode);
                }
            }
            
            if(acc!=null && acc.BillingCity!=null){
                acc.Postal_Code_Zip_Code__c = pincode;
                Update acc;
            }
            
            return 'Postal Code Is : ' + pincode;
        }else if(acc.BillingCity!=null && acc.BillingCity.contains(' ')){
            String str = acc.BillingCity.replace(' ', '%20');   
            
            String endPoint = 'https://api.postalpincode.in/postoffice/'+str; 
            System.debug('endPoint==' +endPoint);
            Http hp = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            HttpResponse response = hp.send(request);
            result = response.getBody();
            System.debug('Result==' +result);
            System.JSONParser jp = JSON.createParser(result);
            while(jp.nextToken()!=null){
                if(jp.getText()=='PINCode'){
                    jp.nextToken();
                    pincode = jp.getText();
                    System.debug('pincode==' +pincode);
                }
            }
            
            if(acc!=null && acc.BillingCity!=null){
                acc.Postal_Code_Zip_Code__c = pincode;
                Update acc;
            }
            
            return 'Postal Code Is : ' + pincode;
        }else{
            return 'BillingCity is null';
        }
        
    }
}