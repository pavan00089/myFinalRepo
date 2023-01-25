({
	doInit : function(component, event, helper) {
		var action = component.get('c.getRecords');
        action.setCallback(this,function(a)
                           {
                             var state = a.getState();
                               if(state=='SUCCESS')
                               {
                                   component.set('v.accountList',a.getReturnValue());
                               }
                           });
        $A.enqueueAction(action);
	}
})