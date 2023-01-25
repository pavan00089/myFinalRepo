@isTest
private class TaskUtilTest {
	

@isTest static void testTaskPriority() {
   
   String s1= TaskUtil.getTaskPriority('NA');
    system.assertEquals('Normal', s1);
    
    String s2= TaskUtil.getTaskPriority('CA');
     system.assertEquals('High', s2);
    
    String s3= TaskUtil.getTaskPriority('CACD');
     system.assertEquals(null, s3);
}
}