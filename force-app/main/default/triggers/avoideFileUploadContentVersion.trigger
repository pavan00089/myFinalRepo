trigger avoideFileUploadContentVersion on ContentVersion (before insert) {
    
    Id profileId=userinfo.getProfileId();
    String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
  for (ContentVersion cv : Trigger.new) {
        // Origin is 'H' for Chatter files, 'C' for Content documents
        // Leave out the test for Origin if you want to cover both
        if (cv.Origin == 'H' && profileName=='System Administrator1') {
            cv.addError('You cannot upload files using chatter content version');
        }
    }  
}