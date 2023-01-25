@isTest
private class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();

        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(Company = 'JohnMiller', LastName = 'Mike '+i, Status = 'Open'));
        }
        insert leads;
		system.debug('size:'+leads.size());
    }
    @isTest static void test() {
        Test.startTest();
        LeadProcessor ulp = new LeadProcessor();
        Id batchId = Database.executeBatch(ulp);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where leadsource = 'Dreamforce']);
    }
}