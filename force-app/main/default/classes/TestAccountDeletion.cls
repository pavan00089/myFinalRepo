@isTest
private class TestAccountDeletion {
	@isTest static void TestDeleteAccountWithOneOpportunity() {
        
   /*     Account acc = new Account(Name='Pavan Thammali Test');
        insert acc;
        
        Opportunity opp = new Opportunity(Name='Test deletion trigger',AccountId=acc.Id,StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1));
        insert opp; */
        
        Account[] accts = TestDataFactory.createAccountsWithOpps(1,1);
        
        Test.startTest();
        	 Database.DeleteResult result = database.delete(accts[0],false);
        Test.stopTest();
        
        system.assert(!result.isSuccess());
        System.assert(result.getErrors().size()>0);
        
        system.assertEquals('Cannot delete the Accout as it has related opportunity',result.getErrors()[0].getMessage());
        
    }
     @isTest static void TestDeleteAccountWithNoOpportunities() 
     {
       Account[] accts = TestDataFactory.createAccountsWithOpps(1,0);
        
        Test.startTest();
        	 Database.DeleteResult result = database.delete(accts[0],false);
        Test.stopTest(); 
         
         system.assert(result.isSuccess());
     }
    
   @isTest static void TestDeleteBulkAccountsWithOneOpportunity()
    {
        Account[] accts = TestDataFactory.createAccountsWithOpps(200,1);
        
        Test.startTest();
        	 Database.DeleteResult[] result = database.delete(accts,false);
        Test.stopTest();  
        
        for(Database.DeleteResult res : result)
        {
        system.assert(!res.isSuccess());
        System.assert(res.getErrors().size()>0);
        
        system.assertEquals('Cannot delete the Accout as it has related opportunity',res.getErrors()[0].getMessage());
        }
    }
      @isTest static void TestDeleteBulkAccountsWithNoOpportunities() {
       
          Account[] accts = TestDataFactory.createAccountsWithOpps(200,0);
          
        Test.startTest();
        	 Database.DeleteResult[] result = database.delete(accts,false);
        Test.stopTest();  
          
           for(Database.DeleteResult res : result)
           {
        	system.assert(res.isSuccess()); 
           }
          
      }
    
}