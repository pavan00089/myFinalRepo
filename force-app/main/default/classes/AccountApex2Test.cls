@isTest
public with sharing class AccountApex2Test {
    @isTest
    public static void testmethod1()
    {
      List<Account> accList =   AccountApex2.getAccountList();
      System.debug('accList:'+accList.size());
        system.assertEquals(0, accList.size(),'size greater than 0');
        System.debug('accListttt:'+accList.size());
    }
}