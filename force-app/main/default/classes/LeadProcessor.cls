public class LeadProcessor  implements
    Database.Batchable<sObject>, Database.Stateful {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'Select id,name,LeadSource from Lead'
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
       
        List<Lead> updateLeads = new LIST<Lead>();
        
        for(Lead l : scope) 
        {
           l.LeadSource = 'Dreamforce';
           updateLeads.add(l); 
        }
        
        update updateLeads;
       
    }
    public void finish(Database.BatchableContext bc){

    }

}