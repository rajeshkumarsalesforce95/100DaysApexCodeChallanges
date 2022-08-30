public class SalesforceToSalesforceIntegration {
    public static void test(){
        HttpRequest req = new HttpRequest();
        String query='select+Id,Name+from+Account';
        req.setEndpoint('callout:SalesforceAuth/services/data/v49.0?q='+query);
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse resp = http.send(req);
        system.debug('Body:'+resp.getBody());
    }
}