({
	doInit : function(component, event, helper) {
		var action = component.get('c.testNoOfOptyes'); 
        action.setParams({
            "recordId" : component.get('v.recordId') 
        });
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                component.set('v.optys', a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})