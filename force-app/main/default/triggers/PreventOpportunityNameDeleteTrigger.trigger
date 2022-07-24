/*
 * Prevent Opportunity from being deleted if Opportunity greater then or equal to 75%
 */ 
trigger PreventOpportunityNameDeleteTrigger on Opportunity (before delete) {
    for(Opportunity opp : trigger.old){
        if(opp.Probability>=75){
            opp.addError('Opportunities with Probabilities 75% or More than that can not be deleted.');
        }
    }
}