@isTest
public class test_contentVersion {
	 static testMethod void testSubAddFiles() 
    { 
         	ContentVersion content=new ContentVersion(); 
            content.Title='Avoid Chatter post'; 
            Blob bodyBlob=Blob.valueOf('Unit Test ContentVersion Body'); 
            content.VersionData=bodyBlob; 
            //content.LinkedEntityId=sub.id;
            content.origin = 'H';
        Database.SaveResult result = Database.insert(content, false);
        System.assertEquals('You cannot upload files using chatter content version',result.getErrors()[0].getMessage());
    }
}