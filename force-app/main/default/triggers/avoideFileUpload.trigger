trigger avoideFileUpload on FeedItem (before insert) {
   
    Id profileId=userinfo.getProfileId();
    String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
    for(FeedItem fi : trigger.new)
    {
        if((fi.type=='ContentPost' || fi.body=='InlineImage' ) && profileName=='System Administrator')
        {
            fi.addError('You cannot upload a file feedItem:');
        }
    }
}