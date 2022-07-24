/* Write an trigger On Account, when an account insert, automatically Account Billing should populate in the Account Shipping Address.
 * Note : Also write an test class as well
 */

trigger AccountBillingAdrressTrigger on Account (before insert) {
    for(Account acc : trigger.new){
        if(acc.BillingStreet!=null && acc.BillingStreet!=''){
            acc.ShippingStreet = acc.BillingStreet;
        }
        if(acc.BillingCity!=null && acc.BillingCity!=''){
            acc.ShippingCity = acc.BillingCity;
        }
        if(acc.BillingPostalCode!=null && acc.BillingPostalCode!=''){
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
        if(acc.BillingState!=null && acc.BillingState!=''){
            acc.ShippingState = acc.BillingState;
        }
        if(acc.BillingCountry!=null && acc.BillingCountry!=''){
            acc.ShippingCountry = acc.BillingCountry;
        }
    }
}