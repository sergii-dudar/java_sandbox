namespace Sandbox;

/// <summary>Tiny "system under test" used by the example tests.</summary>
public static class Calculator
{
    public static int Add(int a, int b) => a + b;

    public static int Divide(int dividend, int divisor)
    {
        if (divisor == 0)
        {
            throw new ArgumentException("division by zero", nameof(divisor));
        }

        return dividend / divisor;
    }

    public static bool IsEven(int n) => n % 2 == 0;

    public static string FizzBuzz(int n) => n switch
    {
        _ when n % 15 == 0 => "FizzBuzz",
        _ when n % 3 == 0 => "Fizz",
        _ when n % 5 == 0 => "Buzz",
        _ => n.ToString(),
    };
}
