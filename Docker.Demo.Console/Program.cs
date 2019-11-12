using System;

namespace Docker.Demo.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            new AlipayTest().Run();
            var yourName = System.Console.ReadLine();
            System.Console.WriteLine($"Hello {yourName},Hello World!");
        }
    }
}
