@isTest
private class TestRestrictContactByName {

    @isTest static void TestRestrictContactByName()
    {
        Contact con = new Contact(Firstname='Pavan Thammali',lastName='INVALIDNAME');
        
        Database.saveResult result = database.insert(con,false);
        
        system.assert(!result.isSuccess());
        System.assert(result.getErrors().size()>0);
        
        system.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',result.getErrors()[0].getMessage());
        
        
        
    }
}