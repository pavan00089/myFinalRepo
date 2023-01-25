public class AnimalLocator {

    public static String getAnimalNameById(Integer i)
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+i);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
		String res ;
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // git conflict test 1
            Map<String,object> c = (Map<String,object>)results.get('animal');
            res= String.valueOf(c.get('name'));
			
        }
        return res;


    }
    
}