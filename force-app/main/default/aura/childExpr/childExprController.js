({
    updateChildAttr: function(cmp) {
        console.log('in updateChildAttr');
        cmp.set("v.childAttr", "updated child attribute");
    },
    onChildAttrChange: function(cmp, evt) {
        console.log('in onChildAttrChange');
        console.log("childAttr has changed");
        console.log("old value: " + evt.getParam("oldValue"));
        console.log("current value: " + evt.getParam("value"));
    }
})