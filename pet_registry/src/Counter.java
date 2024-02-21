class Counter implements AutoCloseable {
    private int count = 0;
    private boolean closed = false;

    public Counter() {
        System.out.println("Counter created");
    }

    public void add() {
        if (!closed) {
            count++;
        } else {
            throw new IllegalStateException("Counter is closed");
        }
    }

    @Override
    public void close() {
        System.out.println("Counter closed");
        closed = true;
    }
}