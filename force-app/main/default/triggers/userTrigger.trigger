trigger userTrigger on User (after insert,after update) {

    if(Trigger.isAfter)
    {
       List<PermissionSetAssignment> permissionSetinsertList = new List<PermissionSetAssignment>();
       Id caseManageruserRoleId = [Select id from userRole where Developername='Case_Manager'].Id;
       list<id> lstuseridtoberemoved = new list<id>();
       list<id> lstuseridtobeAdded = new list<id>();
       PermissionSet permissionstobeassigned = [SELECT Id, Name FROM PermissionSet WHERE Name = 'Manage_Cases' limit 1];
        if(Trigger.isInsert)
        {
            for(User u : Trigger.new)
            {
                
                if(u.UserRoleId==caseManageruserRoleId)
                {
                   lstuseridtobeAdded.add(u.Id); 
                }
            }
        }
        if(Trigger.isUpdate)
        {
           for(User u : Trigger.new)
            {
                if(u.UserRoleId != Trigger.OldMap.get(u.id).userRoleId && u.UserRoleId==caseManageruserRoleId)
                {
                  lstuseridtobeAdded.add(u.id);
                }
                if(u.UserRoleId != Trigger.OldMap.get(u.id).userRoleId && Trigger.OldMap.get(u.id).userRoleId==caseManageruserRoleId)
                {
                  lstuseridtoberemoved.add(u.id);
                }

            } 
        }
        if(!lstuseridtobeAdded.isEmpty())
        {
            for(Id userId : lstuseridtobeAdded)
            {
               PermissionSetAssignment ps = new PermissionSetAssignment();
               Ps.PermissionSetId = permissionstobeassigned.Id;
               ps.AssigneeId = userId;
               permissionSetinsertList.add(ps);
            }
        }
        if(!permissionSetinsertList.isEmpty())
        {
            insert permissionSetinsertList;
        }
        if(!lstuseridtoberemoved.isEmpty())
        {
            Delete [Select id from PermissionSetAssignment where AssigneeId IN : lstuseridtoberemoved AND PermissionSetId=: permissionstobeassigned.Id];
        }
    }
}