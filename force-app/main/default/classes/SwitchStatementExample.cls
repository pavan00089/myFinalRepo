public class SwitchStatementExample {

    public static void switchExample(){
     
     Account acc = [Select id,AccountSource,rating from Account where id='0015g00000ibM8xAAE'];   
     
        switch on acc.rating{
           when 'Hot' {
               //If num is 3 this block is called
               System.debug('when num is Hot');
           }
           when 'Warm'{
               //If num is 5 this block is called
               System.debug('when num is warm');
           }
            when 'Cold'{
               //If num is 5 this block is called
               System.debug('when num is cold');
                if(acc.AccountSource=='Web')
                {
                  System.debug('when source is web');  
                }
           }
        /*   when else {
               //If num did not match any of the blocks already, this block is called
               System.debug('when num was nothing');
           } */
        }
    }
}