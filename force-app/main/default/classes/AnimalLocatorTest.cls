@isTest
public class AnimalLocatorTest {
  @isTest 
	static void testanimalLocator() {
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    String s1 = AnimalLocator.getAnimalNameById(1); 
    // Verify that the response received contains fake values
    system.assertEquals('chicken', s1);
    }
}