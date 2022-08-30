/*
*   Author           : Rajesh Kumar
*   Description      : getting access token using HTTPCalloutFramework
*   Created Date     : 30/08/2022
*   LastModifiedDate : 30/08/2022 09:06:00:00:00:00 AM
*   Change Logs#     : 
*/
public with sharing class RecruitingAppServiceCallout {
    public static String accessToken='';
    public static HttpResponse callout() {
        HTTPCalloutService service = new HTTPCalloutService('RecruitingAppAPI');
        //System.debug(service.getRequest());
        //System.debug(service.sendRequest().getBody());
        System.HttpResponse res = service.sendRequest();
        String responseBody = res.getBody();
        System.debug(responseBody);
        System.JSONParser jp = JSON.createParser(responseBody);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken = jp.getText();
            }
        }
        if(accessToken!=null){
            HTTPCalloutService service1 = new HTTPCalloutService('GetAccountDataAPI');
            service1.setHeaderParameter('Authorization', 'Bearer '+accessToken);
            System.HttpResponse res1 = service1.sendRequest();
            String responseBody1 = res1.getBody();
            System.debug(responseBody1);
            System.debug('Status Code : ' + res1.getStatusCode());
            return res1;
        }

        return null;
    }
}