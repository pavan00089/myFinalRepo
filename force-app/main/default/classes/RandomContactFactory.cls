public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer noOfContacts,String lname)
    {
        List<Contact> conList = new List<Contact>();
        
        for(Integer i=0;i<noOfContacts;i++)
        {
            contact con = new contact(firstname='test'+i,lastname='Test '+i);
            conList.add(con);
            
        }
      return conList;  
    }
}