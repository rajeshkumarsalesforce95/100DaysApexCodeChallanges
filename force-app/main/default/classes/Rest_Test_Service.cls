@RestResource(urlMapping='/mycall/*')
global class Rest_Test_Service {
	@HttpGet
    global static String call(){
        return 'Rajesh Kumar';
    }
    
    @HttpPost
    global static String create(String name, String industry){
        String status;
        try{
            Account acc =  new Account();
            acc.name = name;
            acc.Industry = industry;
            insert acc;
            status = 'Success';
        }catch(Exception ex){
            System.debug('Exception : ' + ex.getMessage());
            status ='failed';
        }
        
        return status;
    }
    
}