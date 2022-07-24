/*Q.1  I have book and author objects. Author is parent and book is child and they are linked using lookup. 
 *     I want to count total number of books written by an Author. On Author, we should be able to view number of books.

Ans : This is a very tricky question. Most of candidates will answer rollup summary field. Remember, 
      roll up summary only works on master detail relationship. We have to create an Apex after trigger on child object. 
      In Apex trigger, we have to cover after insert, after update, after delete and after undelete events. You can get an overview of code here.*/

trigger BookRollUpTrigger on Book__c (after insert,after update,after delete,after undelete) {
      Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
          if(!myCS.Disable_Trigger__c){
          if(Trigger.isafter){
            if(Trigger.isinsert || Trigger.isundelete){
                AuthorBookrollupHelper.processRecords(Trigger.new);
            }
            if(Trigger.isUpdate){
               AuthorBookrollupHelper.processRecords(Trigger.new);
               AuthorBookrollupHelper.processRecords(Trigger.old);
            }
            if(Trigger.isdelete){
               AuthorBookrollupHelper.processRecords(Trigger.old);
            }
        }
    }
}