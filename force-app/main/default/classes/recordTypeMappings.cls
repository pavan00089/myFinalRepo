public class recordTypeMappings {
	
     private static Map<String, Record_Type_Mapping__mdt> globalDescribe ;
    
     public  recordTypeMappings()
       {
         if(globalDescribe == null)  globalDescribe = fetchValues();     
       }
    
    private Map<String,Record_Type_Mapping__mdt> fetchValues()
    {
        Map<String,Record_Type_Mapping__mdt> outputMap = new  Map<String,Record_Type_Mapping__mdt>();        
        for(Record_Type_Mapping__mdt c  : Record_Type_Mapping__mdt.getall().values())
        {
            if(!outputMap.containsKey(c.Search_Key__c))
            {
              outputMap.put(c.Search_Key__c,c);
            }
        }
        return outputMap;
    }
    
    public  String getRecordTypeName(String searchKey)
    {
        if(globalDescribe.get(searchKey) != null)
        {
            return globalDescribe.get(searchKey).Record_Type_Name__c;
        }
        else return null; // we will actually performs the logic to directly query the custom metadata record 
    }
}