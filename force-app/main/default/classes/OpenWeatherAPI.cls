/* Auther : [Rajesh Kumar]
 * CreatedDate : 14-Aug-22
 * Description : Call current weather data
 */ 
public class OpenWeatherAPI{ 
    @future(callout=true)
    public static void getWeather(String apiKey){
        
        List<Open_Weather_API_Response__c> weatherListInsert = new List<Open_Weather_API_Response__c>();
        List<OpenWeatherAPI__c> csList = OpenWeatherAPI__c.getall().values();
        List<Exception_Log__c> errorLogs = new List<Exception_Log__c>();
        
        try{
           HttpRequest req = new HttpRequest();
           req.setEndpoint('callout:OpenWeatherAPI/data/2.5/weather?q='+csList[0].name+','+csList[0].Country_Code__c+'&appid='+apiKey);
           req.setMethod('POST');
           Http http = new Http();
           HTTPResponse res = http.send(req);
           System.debug(res.getBody());
           String jsonString = res.getBody();
           System.JSONParser jp = JSON.createParser(jsonString);
            
           Open_Weather_API_Response__c objData = new Open_Weather_API_Response__c();
           While(jp.nextToken()!=null){
               if(jp.getText()=='lon'){
                   jp.nextToken();
                   objData.Longitude__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='lat'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.Latitude__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='temp'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.Temperature__c = String.valueOf(jp.getDecimalValue())+'°F°C';
               }
               if(jp.getText()=='feels_like'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.feels_like__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='temp_min'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.temp_min__c = String.valueOf(jp.getDecimalValue())+'°C';
               }
               if(jp.getText()=='temp_max'){
                   jp.nextToken();
                   //System.debug(jp.getDecimalValue()); 
                   objData.temp_max__c = String.valueOf(jp.getDecimalValue())+'°C';
               }
               if(jp.getText()=='pressure'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.Pressure__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='humidity'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getText()));
                   objData.Humidity__c = jp.getDecimalValue();
               }
               if(jp.getText()=='sea_level'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.sea_level__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='grnd_level'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.grnd_level__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='visibility'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.visibility__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='speed'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.speed__c = String.valueOf(jp.getDecimalValue())+' mph';
               }
               if(jp.getText()=='deg'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.deg__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='gust'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.gust__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='country'){
                   jp.nextToken();
                   //System.debug(jp.getDecimalValue());
                   objData.Country_Code__c = jp.getText();
               }
               if(jp.getText()=='sunrise'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.sunrise__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='sunset'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.sunset__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='timezone'){
                   jp.nextToken();
                   //System.debug(String.valueOf(jp.getDecimalValue()));
                   objData.timezone__c = String.valueOf(jp.getDecimalValue());
               }
               if(jp.getText()=='name'){
                   jp.nextToken();
                   //System.debug(jp.getText());
                   objData.City_Name__c = jp.getText()+', Rajasthan, India\n '+System.Today()+'\n Mostly cloudy';
               }
               if(jp.getText()=='cod'){
                   jp.nextToken();
                   //System.debug(jp.getText());
                   objData.cod__c = jp.getText();
               }
               
           }
           weatherListInsert.add(objData);
           System.debug('Size : ' + weatherListInsert.size());
           if(weatherListInsert.size()>0){
                insert weatherListInsert;
           }
        }catch(Exception ex){
            System.debug('Exception : ' + ex.getMessage() + ' Line Number :: ' + ex.getLineNumber());
            Exception_Log__c log = new Exception_Log__c();
            log.Error_Message__c = ex.getMessage();
            log.Line_Number__c = String.valueOf(ex.getLineNumber());
            log.Stack_Trace__c = ex.getStackTraceString();
            log.Init_Cause__c = String.valueOf(ex.getCause());
            log.Type_Name__c = ex.getTypeName();
            errorLogs.add(log);
            if(errorLogs.size()>0){
                 insert errorLogs;
            }
        }
    }
}