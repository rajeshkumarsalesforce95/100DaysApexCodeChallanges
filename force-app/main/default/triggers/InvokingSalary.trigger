/* Invoking the apex class from the trigger
 * Whenever new customers record is created/Updated then income tax should be calculated based on salary
 * and should be updated to field income tax(Currency Field).
 */
trigger InvokingSalary on Account (before insert, before Update) {
    Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    if(!myCS.Disable_Trigger__c){
        for(Account acc : Trigger.new){
            acc.income__c =(500*12/acc.AnnualRevenue)*100;
        }
    }
}