using System;

class Mine : IDisposable {
    public Mine() {
        Console.WriteLine("open");
    }

    ~Mine() {
        this.Dispose(false);
    }

    public void Dispose() {
        Console.WriteLine("close");
        this.Dispose(true);
    }
    public virtual void Dispose(bool disposing) {}
}

public class Program {
    public static void Main(string[] args) {
        using (var mine = new Mine()) {
            Console.WriteLine("hi");
        }
        var me = new Mine();
        using (me) {
            Console.WriteLine("poi");
        }
    }
}
