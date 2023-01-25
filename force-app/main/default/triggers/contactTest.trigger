trigger contactTest on Contact (before update) {

    for(Contact cc : trigger.new)
    {
        if(cc.firstname != null)
        {
            cc.addError('firstname should be null');
        }
    }

}