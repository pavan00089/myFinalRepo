@isTest
private class DailyLeadProcessorTest {
public static String CRON_EXP = '0 0 0 ? * * *';
 static testmethod void testScheduledJob() {
        // Create some out of date Opportunity records
        List<lead> leads = new List<lead>();
        for (Integer i=0; i<500; i++) {
			if(i<250)
            {
                leads.add(new lead(lastname='thammali32',company='Salesfore'));
            }
            else {
               leads.add(new lead(lastname='thammali',company='Salesfore2',leadSource='other')); 
            }
        }
        insert leads;

        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('DailyLeadProcessorTest',
            CRON_EXP,
            new DailyLeadProcessor());
        
        Test.stopTest();
      system.assertEquals(200, [Select count() from lead where leadSource='Dreamforce']);
    
}
}