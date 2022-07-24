@RestResource(urlMapping='/getContactsAndAccountsAPI/v1/*' )
global class GetContactsAndCreateAccountsRESTAPI {
	@HttpGet
    global static void getContacts() {
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        try{
            List<Contact> conList = [select id,name,firstname,lastname,phone,Account.name,Email from Contact];
            String conJsonString = '';
            for(Contact con : conList){
                conJsonString = conJsonString + '{"Name":"'+con.name+'","First_Name":"'+con.firstname+'","Last_Name":"'+con.lastname+'","Phone":"'+con.Phone+'","Account_Name":"'+con.Account.name+'","Email":"'+con.Email+'"},';
            }
            
            String finalConJsonString = conJsonString.removeEnd(',');
            String jsonstrt = '{"Status":"Success", "Ststus_Code":200, "data": {';
            String responseJSON = jsonstrt +'"Contact_Details":['+finalConJsonString+']}}';
            res.addHeader('Content-Type','application/json');
            res.addHeader('Access-Control-Allow-Orign','*');
            res.addHeader('Access-Control-Allow-Methods','*');
            res.responseBody = Blob.valueOf(responseJSON);
            res.statusCode = 200;
        }catch(Exception ex){
            System.debug('Error Message : ' + ex.getMessage());
            String response = '{"Status":"ERROR", "Ststus_Code":400, "data":{ "Exception":"'+ex.getMessage()+'"}}';
            res.addHeader('Content-Type','application/json');
            res.addHeader('Access-Control-Allow-Orign','*');
            res.addHeader('Access-Control-Allow-Methods','*');
            res.responseBody = Blob.valueOf(response);   
            res.statusCode = 400;
        }
    }
    
    @HttpPost
    global static void createAccount() {
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        try{ 
            String reqBody=req.requestBody.toString();
            System.debug('reqBody==' +reqBody);
            JSON2Apex jsonRequest =(JSON2Apex)JSON.deserialize(reqBody, JSON2Apex.class);
            List<Account> insertAccList = new List<Account>();
            Set<Id> accID = new Set<Id>();
            for(Integer i=0;i<jsonRequest.Data.Account_Details.size();i++){
                Account acc = new Account();
                acc.name = (jsonRequest.Data.Account_Details[i].name!=null && jsonRequest.Data.Account_Details[i].name!='')?jsonRequest.Data.Account_Details[i].name:'TestAccount';
                acc.AccountNumber = jsonRequest.Data.Account_Details[i].AccountNumber!=null?jsonRequest.Data.Account_Details[i].AccountNumber:null;
                acc.Industry = jsonRequest.Data.Account_Details[i].Industry;
                acc.Phone = jsonRequest.Data.Account_Details[i].Phone;
                acc.Type = jsonRequest.Data.Account_Details[i].Type;
                acc.Website = jsonRequest.Data.Account_Details[i].Website;
                acc.BillingStreet = jsonRequest.Data.Account_Details[i].BillingStreet;
                acc.BillingCity = jsonRequest.Data.Account_Details[i].BillingCity;
                acc.BillingPostalCode = jsonRequest.Data.Account_Details[i].BillingPostalCode;
                acc.BillingState = jsonRequest.Data.Account_Details[i].BillingState;
                acc.BillingCountry = jsonRequest.Data.Account_Details[i].BillingCountry;
                insertAccList.add(acc);
            }
            
            if(insertAccList.size()>0){
                insert insertAccList;
            }
            
            for(Account acc : insertAccList){
                accID.add(acc.id);
            }
            if(accID.size()>0){
                String accJsonString = '';
                List<Account> accList = [select id,name from Account WHERE ID IN : accID];
                for(Account acc : accList){
                    accJsonString = accJsonString + '{"RecordId":"'+acc.Id+'"},';
                }
                
                String finalConJsonString = accJsonString.removeEnd(',');
                String jsonstrt = '{"Status":"Success", "Ststus_Code":200, "data": {';
                String responseJSON = jsonstrt + '"New_Accounts":['+finalConJsonString+']';
                res.addHeader('Content-Type','application/json');
                res.addHeader('Access-Control-Allow-Orign','*');
                res.addHeader('Access-Control-Allow-Methods','*');
                res.responseBody = Blob.valueOf(responseJSON);
                res.statusCode = 200;
            }
        }catch(Exception ex){
            System.debug('Error Message : ' + ex.getMessage());
            String response = '{"Status":"ERROR", "Ststus_Code":400, "data":{ "Exception":"'+ex.getMessage()+'"}}';
            res.addHeader('Content-Type','application/json');
            res.addHeader('Access-Control-Allow-Orign','*');
            res.addHeader('Access-Control-Allow-Methods','*');
            res.responseBody = Blob.valueOf(response);   
            res.statusCode = 400;
        }
    }
}