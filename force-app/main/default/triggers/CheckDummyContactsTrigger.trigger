// Whenever Createing or updating on Account,then We have to check whether is dummy Contacts is Present or not for perticular Account, 
// if it is not Present then we have to create new dummy Contact and we also want copy the address from Account to thsese contacts.

trigger CheckDummyContactsTrigger on Account (After insert, After update) {
    List<Contact> conList = new List<Contact>();
    Set<Id> accIds = new Set<ID>();
    if(trigger.isInsert){
        for(Account acc : trigger.new){
            Contact con = new Contact();
			con.firstname= 'Rajesh';
			con.lastname ='Kumar';
			con.AccountId = acc.id;
			con.MailingStreet = acc.BillingStreet;
			con.MailingCity = acc.BillingCity;
            con.MailingPostalCode = acc.BillingPostalCode;
            con.MailingState = acc.BillingState;
			con.MailingCountry = acc.billingCountry;
			conList.add(con);
        }
        
        if(conList.size()>0){
            insert conList;
        }
    }else if(trigger.isUpdate){
        for(Account acc : trigger.new){
            accIds.add(acc.id);
        }
        
        if(!accIds.isEmpty()){
            List<Account> accList = [select id,name,(select id,name from Contacts) from Account WHERE ID IN : accIds];
            for(Account acc : accList){
                if(acc.contacts.size()>0){
                    for(Contact con : acc.contacts){
                        if(con.FirstName!='Dummy' || con.LastName!='Contact'){
                            Contact newContact = new Contact();
                            newContact.firstname= 'New';
                            newContact.lastname ='Contact Records';
                            newContact.AccountId = acc.id;
                            newContact.MailingStreet = acc.BillingStreet;
                            newContact.MailingCity = acc.BillingCity;
                            newContact.MailingPostalCode = acc.BillingPostalCode;
                            newContact.MailingState = acc.BillingState;
                            newContact.MailingCountry = acc.billingCountry;
                            conList.add(newContact);
                        }else{
                            //Not existing Dummy Conatcts Records
                        }
                    }
                    
                    if(conList.size()>0){
                        insert conList;
                    }
                }
            }
        }
    }
}