public class AddPrimaryContact implements Queueable {

    private string inputCity;
    private contact inputContact;
    public AddPrimaryContact(Contact con,String billingCity)
    {
        this.inputContact = con;
        this.inputCity = billingCity;
    }
    
    public void execute(QueueableContext context) {
        List<Contact> conList = new List<Contact>();
        for (Account acc : [Select id from Account where BillingState=:inputCity limit 200]) {
          	contact con = inputContact.clone();
            con.AccountId = acc.id;
			conList.add(con);            
        }
        insert conList;
}
}