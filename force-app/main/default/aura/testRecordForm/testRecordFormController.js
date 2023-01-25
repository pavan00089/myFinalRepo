({
	doInit : function(component, event, helper) {
		 var CaseStatus ;
        if(component.get('v.sObjectType') == 'Account')
        {
         CaseStatus  = component.get("v.accountRecord").Name 
        }
        else if(component.get('v.sObjectType') == 'Opportunity')
        {
             CaseStatus  = component.get("v.opportunityRecord").Account.Name; 
        }
        console.log('CaseStatus:'+CaseStatus);
	},
   checkObject : function(component, event, helper) {
		 let sObject = component.get('v.sObjectType');
        if(sObject === 'Account')
		{
         component.set('v.isAccountObject', true);   
        }
       else if(sObject === 'Opportunity')
       {
         component.set('v.isOpportunityObject', true);     
       }
	}
})