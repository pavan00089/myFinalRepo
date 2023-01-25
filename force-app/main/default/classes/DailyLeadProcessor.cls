public class DailyLeadProcessor implements Schedulable {
	public void execute(SchedulableContext ctx) {
        List<Lead> leadList = [Select id,leadsource from lead where leadsource=null limit 200 ];
        
        for(Lead l : leadList)
        {
            l.leadSource = 'Dreamforce';
        }
        update leadList;
    }
}