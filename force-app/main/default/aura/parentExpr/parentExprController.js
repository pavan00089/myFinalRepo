/* parentExprController.js */
({
    updateParentAttr: function(cmp) {
        console.log('in updateParentAttr');
        console.log('Hello:'+cmp.get("v.parentAttr"));
        cmp.set("v.parentAttr", "updated parent attribute");
    },
    onParentAttrChange: function(cmp, evt) {
        console.log('in onParentAttrChange');
        console.log("parentAttr has changed");
        console.log("old value: " + evt.getParam("oldValue"));
        console.log("current value: " + evt.getParam("value"));
    }
})