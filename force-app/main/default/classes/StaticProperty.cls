public class StaticProperty {

    public static List<Account> Age;
    public static Integer  Amount;
    
    public static List<Account> MyGoodStaticProp { 
     get {return Age;} 
     set { Age = value; } 
   } 
    public static integer MyGoodNonStaticProp { 
     get {return Amount;} 
     set { Amount = value; } 
   } 
    public Integer phone{
        get {return method1();}
    }
    public Integer method1()
    {
        return 10;
    }
}