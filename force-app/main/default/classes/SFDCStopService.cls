/*
*  Author           : Rajesh Kumar @infosys.com
*  Description      : This class is used as a service for all SFDC Stop API's
*  Created Date     : 28/08/2022
*  LastModifiedDate : 28/08/2022
*  Change Logs#     : 
*/
public with sharing class SFDCStopService {
    public static HttpResponse getSFDCStopBlogs() {
        HTTPCalloutService service = new HTTPCalloutService('SFDCStopBlogs');
        HttpResponse blogAPIResponse = service.sendRequest();
        return blogAPIResponse;
    }
}