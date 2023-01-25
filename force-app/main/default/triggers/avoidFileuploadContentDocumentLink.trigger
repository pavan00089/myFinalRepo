trigger avoidFileuploadContentDocumentLink on ContentDocumentLink (before insert) {
 /* for (ContentDocumentLink cv : Trigger.new) {
        // Origin is 'H' for Chatter files, 'C' for Content documents
        // Leave out the test for Origin if you want to cover both
       if (cv.Origin == 'H' ) {
            cv.addError('You cannot upload files using chatter content version');
        }
    }  */
}