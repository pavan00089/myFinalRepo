trigger testTrigger on Account (before update,after update,before insert,after insert) {
        if(Trigger.isUpdate){
            if(Trigger.isBefore )
            {
                for(Account acc : Trigger.new)
                {

                    system.debug('RecordId:'+acc.Id);
                    system.debug('name:'+acc.name);
                    system.debug('phone:'+acc.phone);
                    
                }
            }
            if(trigger.isAfter)
            {
                for(Account acc : trigger.new)
                {                  
                    system.debug('RecordId:'+acc.Id);
                    system.debug('name:'+acc.name);
                    system.debug('phone:'+acc.phone);
                }
            }
        }
    
}