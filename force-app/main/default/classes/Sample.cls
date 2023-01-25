public class Sample {
    public String dat {get;set;}
    public Account acc {get;set;}
    public Sample(ApexPages.StandardController controller) {
	this.acc = fetchDetails();   
    }
    public Account fetchDetails()
    {
        return [Select id,Next_Evaluation_Date__c from Account LIMIT 1];
    }
}