public class Demo2 {

    public string helloWorldString;
    private static final String DEFAULT_STRING;
    
    static{
        system.debug('inside static block;');
      DEFAULT_STRING = 'Hello World !!';
    }
    public Demo2()
    {
       
        this(DEFAULT_STRING);
         system.debug('inside demo2 default;');
    }
        public Demo2(String stringToDisplay)
    {
        system.debug('inside demo2 parameter;');
        this.helloWorldString = stringToDisplay;
    }
    
    public  void printText(){
        system.debug('Display Text :'+helloWorldString);
    }
}