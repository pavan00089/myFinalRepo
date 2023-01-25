trigger avoidFileUploadInComment on FeedComment (before insert) {
	Id profileId=userinfo.getProfileId();
    String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
    for(FeedComment fi : trigger.new)
    {
        if((fi.CommentType=='ContentComment') && profileName=='System Administrator')
        {
            fi.addError('You cannot upload a file feedComment');
        }
    }
}