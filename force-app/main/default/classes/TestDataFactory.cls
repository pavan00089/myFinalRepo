@isTest
public class TestDataFactory {

     public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) 
     {
       List<Account> accList = new List<Account>();
         
         for(Integer i=0 ; i<numAccts ; i++)
         {
           Account a = new Account(Name='Test_Data_Factory'+i);
           accList.add(a);
         }
         insert accList;
         List<Opportunity> oppList = new List<Opportunity>();
         
         for(Integer i=0 ; i<numAccts ;i++)
         {
             Account acc = accList[i];
             
             for(Integer k=0 ; k<numOppsPerAcct ; k++)
             {
                 Opportunity opp = new Opportunity(Name='Test_Data_Opty'+k,AccountId=acc.Id,StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1));
                 oppList.add(opp);
                 
             }
         }
         insert oppList;
         
         return accList;
     }
}