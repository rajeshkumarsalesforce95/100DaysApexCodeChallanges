public class AuthorBookrollupHelper{
    public static void processRecords(List<Book__c> genericList){
        List<Author__c> genericUpdateList = new List<Author__c>();
        List<Author__c> genericdeleteList = new List<Author__c>();
        Set<Id> accountIds = new Set<Id>();
        for(Book__c c:genericList){
            if(c.Author__c!=null){
                 accountIds.add(c.Author__c);
            }
        }
        List<AggregateResult> aggregatelist = [SELECT COUNT(id)amount,Author__c FROM Book__c where Author__c in:accountIds group by Author__c];
        if(aggregatelist != null && aggregatelist.size() > 0){
             for(AggregateResult aggr:aggregatelist){  
                Author__c acc = new Author__c();
                acc.id = (id)aggr.get('Author__c');
                acc.Total_Number_of_Books__c = (decimal)aggr.get('amount');
                genericUpdateList.add(acc);
            }
         }else{ 
              for(Id I:accountIds) {    
                   Author__c acc = new Author__c();            
                   acc.Id = I;            
                   acc.Total_Number_of_Books__c = null;                
                   genericdeleteList.add(acc);           
              }
         }  
          if(genericUpdateList.size()>0){
                update genericUpdateList;
          }
          if(genericdeleteList.size()>0){
                update genericdeleteList;
          } 
   }
}