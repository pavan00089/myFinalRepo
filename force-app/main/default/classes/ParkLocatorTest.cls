@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
		String s1 = 'India';
        List<String> sList = ParkLocator.country(s1);
        // Verify that a fake result is returned
        System.assertEquals(3, sList.size()); 
    }
}