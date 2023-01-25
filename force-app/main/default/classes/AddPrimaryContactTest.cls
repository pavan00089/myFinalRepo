@isTest
public class AddPrimaryContactTest {
    @isTest
    static void testQueueable() {
        List<Account> accounts = new List<Account>();
        // add 100 child accounts
        for (Integer i = 0; i < 300; i++) {
            accounts.add(new Account(
                name='Test Account'+i ,  BillingState='NY'
            ));
        }
        for (Integer i = 0; i < 300; i++) {
            accounts.add(new Account(
                name='Test Account'+i ,  BillingState='CA'
            ));
        }
        insert accounts;
        
        Contact con = new Contact(Firstname='Pavan',lastName='Thammali');
        insert con;
        
        Test.startTest();
        	AddPrimaryContact q = new AddPrimaryContact(con,'NY');
        	 System.enqueueJob(q);
        Test.stopTest();
        
        system.assertEquals(200, [Select count() from contact where contact.Account.BillingState='NY']);
    }
   
}