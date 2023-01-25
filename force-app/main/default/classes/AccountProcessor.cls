public without sharing class AccountProcessor {

    @future
    public static void countContacts(List<Id> accIds)
    {
        List<Account> accList = [Select id,Number_Of_Contacts__c,(select id from contacts) from Account where id in : accIds];
        
        for(Account acc : accList)
        {
            acc.Number_Of_Contacts__c = acc.contacts.size();
        }
        
        update accList;
    }
}