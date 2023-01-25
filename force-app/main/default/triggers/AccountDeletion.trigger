trigger AccountDeletion on Account (before delete) {

   for(Account acc : [Select id from account where id in (Select accountId from opportunity) AND id in : trigger.old])
   {
       trigger.oldmap.get(acc.Id).addError('Cannot delete the Accout as it has related opportunity');
   }
}