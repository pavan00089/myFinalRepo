@isTest
private class TestVerifyDate {
	
    @isTest private static void testDates()
    {
        Date d1 = system.today();
        date d2 = system.today()+20;
        
        date d3 = VerifyDate.CheckDates(d1,d2);
        
        system.assertEquals(d2, d3);
        d2 = d2.addDays(20);
        
        date d4 = VerifyDate.CheckDates(d1,d2);
        system.assertEquals(d1.addDays(8), d4);
        
    }
}