@isTest
private class AccountProcessorTest {
	@testSetup
    private static void testSetup()
    {
		List<Account> accList = new List<Account>();
		for(integer i=0 ; i<10 ; i++)
        {
            Account a = new Account(name='Test'+i);
            accList.add(a);
        }
        insert accList;
    }
    @isTest
    private static void  testMethod1()
    {
       Map<Id,Account> accMap = new Map<Id,Account>([Select id,Number_Of_Contacts__c from Account]);
       List<Id> accIds = new List<Id>();
       accIds.addAll(accMap.keySet());
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
    }
}