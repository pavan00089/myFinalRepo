trigger AccountAddressTrigger on Account (before update,after update) {
    
    if(trigger.isBefore)
    {
        for(Account a : Trigger.new)
        {
            system.debug('Old Values:'+Trigger.oldmap.get(a.id).name);
            system.debug('New Values:'+a.name);
            a.name = 'Hello Dear';
        }
    }
        if(trigger.isAfter)
    {
        for(Account a : Trigger.new)
        {
            system.debug('Old Values after:'+Trigger.oldmap.get(a.id).name);
            system.debug('New Values after:'+a.name);
        }
    }
    
}