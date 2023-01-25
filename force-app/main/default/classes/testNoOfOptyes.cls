public class testNoOfOptyes {

    
    @AuraEnabled
    public static Integer testNoOfOptyes(Id recordId)
   {
       //HELLO
       ////THIS IS PAVAN THAMMALI
       try{
          List<Opportunity> optyList = [Select id from opportunity where AccountId=:recordId];
          return optyList.size(); 
       }
       catch(Exception e)
       {
           return null;
       }
   }
}