public class SmartyStreetsAddressVerification {
    public String authid    {set;get;}
    public String auth_token {set;get;}
    public String street  {set;get;}
    public String city     {set;get;}
    public String state  {set;get;}
    public integer zipcode {set;get;}
    public String resultResponse {set;get;}
    public String endPoint   {set;get;}
    public static SmartyStreets_Address_Verification__c addressSettings = SmartyStreets_Address_Verification__c.getInstance(); 
    
    public void verifyAddress(){
        Http hp = new Http();
        HttpRequest request = new HttpRequest();
        endPoint = 'https://us-street.api.smartystreets.com/street-address?';
        endPoint = endPoint+'auth-id='+authid;
        endPoint=endPoint+'&auth-token='+auth_token;
        endPoint=endPoint+'&street='+street;
        endPoint=endPoint+'&city='+city;
        endPoint=endPoint+'&state='+state;
        endPoint=endPoint+'&candidates=10';
        System.debug('endPoint=' +endPoint);
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = hp.send(request);
        resultResponse = response.getBody();
        System.debug('resultResponse=' +resultResponse);
    }
}