@isTest
private class CaseManagerTest {
    
    private static testmethod void testgetCaseById()
    {
       Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://deloittecom-2ad-dev-ed.my.salesforce.com/services/apexrest/Cases/'
            + recordId;
        
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Case thisCase = CaseManager.getCaseById();
        // Verify results
        System.assert(thisCase != null);
        System.assertEquals('Test record', thisCase.Subject);
    }
     private static testmethod void testcreateCase()
     {
         ID thisCaseId = CaseManager.createCase(
            'Ferocious chipmunk', 'New', 'Phone', 'Low');
        // Verify results
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id,Subject FROM Case WHERE Id=:thisCaseId];
        System.assert(thisCase != null);
        System.assertEquals(thisCase.Subject, 'Ferocious chipmunk');
     }
    
    private static testmethod void TESTdeleteCase() {
        
         Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://deloittecom-2ad-dev-ed.my.salesforce.com/services/apexrest/Cases/'
            + recordId;
        
        request.httpMethod = 'DELETE';
        RestContext.request = request;
        CaseManager.deleteCase();
        
        List<Case> caseList = [Select id from case where id=:recordId];
        system.assert(caseList.size()==0);
        
        
    }

		static testmethod void testUpsertCase() {
        // 1. Insert new record
        ID case1Id = CaseManager.upsertCase(
                'Ferocious chipmunk', 'New', 'Phone', 'Low', null);
        // Verify new record was created
        System.assert(Case1Id != null);
        Case case1 = [SELECT Id,Subject FROM Case WHERE Id=:case1Id];
        System.assert(case1 != null);
        System.assertEquals(case1.Subject, 'Ferocious chipmunk');
        // 2. Update status of existing record to Working
        ID case2Id = CaseManager.upsertCase(
                'Ferocious chipmunk', 'Working', 'Phone', 'Low', case1Id);
        // Verify record was updated
        System.assertEquals(case1Id, case2Id);
        Case case2 = [SELECT Id,Status FROM Case WHERE Id=:case2Id];
        System.assert(case2 != null);
        System.assertEquals(case2.Status, 'Working');    
        }
    
    private static testmethod void testupdateCaseFields() {
        
              Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://deloittecom-2ad-dev-ed.my.salesforce.com/services/apexrest/Cases/'
            + recordId;        
        request.httpMethod = 'PATCH';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf('{"status": "Working"}');
     
        RestContext.request = request; 
        
        Id recordId2 = CaseManager.updateCaseFields();
        
        Case c = [Select id,status from case where id=:recordId2];
        
        system.assert(recordId2!=null);
        system.assertEquals('Working', c.status);
        
        system.assertEquals(recordId, recordId2);
        
    }
 private static Id createTestRecord() {
        // Create test record
        Case caseTest = new Case(
            Subject='Test record',
            Status='New',
            Origin='Phone',
            Priority='Medium');
        insert caseTest;
        return caseTest.Id;
 }
}