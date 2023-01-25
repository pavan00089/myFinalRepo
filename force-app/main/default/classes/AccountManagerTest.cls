@isTest
private class AccountManagerTest {
	@isTest
     static void testGetAccount()
    {
         Account accTest = new Account(
            name='Test record');
        insert accTest;
        
       		contact con = new Contact(
            firstname='Test record first',lastname='testRecordLast',AccountId=accTest.Id);
        	insert con;

        RestRequest request = new RestRequest();
   /*     request.requestUri =
            'https://deloittecom-2ad-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+accTest.Id+'/Contacts'; */
        request.requestUri =
            'https://deloittecom-2ad-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+accTest.Id+'/contacts';
        
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account  accRecord = AccountManager.getAccount();
        // Verify results
        Contact con1 = [Select id,name from contact where AccountId=:accTest.Id];
        System.assert(accRecord!=null);
         System.assert(con1!=null);
    }
    
    
}