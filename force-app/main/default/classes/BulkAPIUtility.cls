public class BulkAPIUtility {

    @InvocableMethod(label='Upload CSV' description='Upload the CSV data in system using Bulk API 2.0')
    public static List<ResponseWrapper> importBulkdata(List<BulkDataWrapper> dataWrapperList) {

        ResponseWrapper rw = new ResponseWrapper();
        if(dataWrapperList.size() == 0) {
            rw.response =  'Please send correct data.';
        }

        String objectName = dataWrapperList[0].objectName;
        String operation = dataWrapperList[0].operation;
        String contentDocumentId = dataWrapperList[0].fileIdList[0];
        ContentVersion cv = [SELECT Id, ContentDocumentId, VersionData FROM ContentVersion WHERE ContentDocumentId =: contentDocumentId ];

        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(URl.getOrgDomainUrl().toExternalForm()+'/services/data/v50.0/jobs/ingest');
        request.setHeader('content-type', 'application/json' );
        request.setHeader('Authorization' ,'Bearer '+userInfo.getSessionId() );//CR  
        String body = '{ '+
                        '"externalIdFieldName": "Id",'+  
                        '"lineEnding": "CRLF",'+ 
                        '"operation": "'+operation+'",'+ 
                        '"object": "'+objectName+'",'+ 
                        '"contentType": "CSV"'+
                      '}';

        request.setBody(body);
        Http h = new Http();
        HttpResponse resp = h.send(request);
        
        if(resp.getStatusCode() <= 299) {
            Map<String, Object> respMap = (Map<String, Object>) Json.deserializeUntyped(resp.getBody());
            String jobId = (String)respMap.get('id');
            
            //second request to store data
            HttpRequest request1 = new HttpRequest();
            request1.setMethod('PUT');
            request1.setEndpoint(URl.getOrgDomainUrl().toExternalForm()+'/services/data/v50.0/jobs/ingest/'+jobId+'/batches');
            request1.setHeader('content-type', 'text/csv' );
            request1.setHeader('Authorization' ,'Bearer '+userInfo.getSessionId() );  
            
            request1.setBody(cv.VersionData.toString());
            Http h1 = new Http();
            HttpResponse resp1 = h1.send(request1);
            
            
            if(resp1.getStatusCode() <= 299) {
                //third request to start processing
                HttpRequest request2 = new HttpRequest();
                request2.setMethod('PATCH');
                request2.setEndpoint(URl.getOrgDomainUrl().toExternalForm()+'/services/data/v50.0/jobs/ingest/'+jobId);
                request2.setHeader('content-type', 'application/json' );
                request2.setHeader('Authorization' ,'Bearer '+userInfo.getSessionId() );  
                
                request2.setBody('{ "state" : "UploadComplete" }');
                Http h2 = new Http();
                HttpResponse resp2 = h2.send(request2);
               
                //Delete the uploaded file as we no longer need that
                Delete [SELECT ID FROM contentDocument WHERE ID =: contentDocumentId];
                if(resp2.getStatusCode() <= 299) {
                    rw.response = 'Data processing Start '+jobId;
                } else {
                 rw.response = 'There was an error. Please contact your admin.';
                }
            }
        }

        return new List<ResponseWrapper>{rw};
    }

    public class BulkDataWrapper {
        @InvocableVariable(label='File Ids' description='File Ids' required=true)
        public List<Id> fileIdList;
        @InvocableVariable(label='Object Name' description='Object Name' required=true)
        public String objectName;
        @InvocableVariable(label='Operation' description='operation' required=true)
        public String operation;

    }

    public class ResponseWrapper {
        @InvocableVariable(label='Response' description='Response' required=true)
        public String response;
        
    }
}