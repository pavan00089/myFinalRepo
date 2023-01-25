public class ParkLocator {

     public static List<String> country(String c) {
        parkService.ParksImplPort  parkS = 
            new parkService.ParksImplPort();
        return parkS.byCountry(c);
    }
}