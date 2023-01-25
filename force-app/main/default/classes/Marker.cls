public virtual class Marker {
    
    public static boolean executed = true;
    public virtual void write() {
        System.debug('Writing some text.');
    }

    public virtual Double discount() {
        return .05;
    }
}