trigger StudentRollUpSummary on Student__c (before update) {
	
     for(Student__c acc : Trigger.new)
    {
        system.debug('value:'+acc.Parent_Object__r.total_students__c);
        system.debug('Age:'+acc.Parent_Object__r.Age__c);
    }
}