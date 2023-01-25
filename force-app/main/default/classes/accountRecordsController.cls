public class accountRecordsController {

    @AuraEnabled
    public static List<Account> getRecords()
   {
       try{
          return [Select id,name,rating,phone from Account  limit 100];
          
       }
       catch(Exception e)
       {
           return null;
       }
   }
}