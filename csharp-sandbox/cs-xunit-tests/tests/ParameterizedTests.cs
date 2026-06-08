using Sandbox;
using Shouldly;
using Xunit;

namespace CsXunitTests;

// Variant: parameterized tests via [Theory] with every data source kind.
public class ParameterizedTests
{
    [Theory]
    [InlineData(2)]
    [InlineData(4)]
    [InlineData(100)]
    [InlineData(0)]
    [InlineData(-8)]
    public void InlineData_IsEven(int number)
    {
        Calculator.IsEven(number).ShouldBeTrue();
    }

    [Theory]
    [InlineData(1, "1")]
    [InlineData(3, "Fizz")]
    [InlineData(5, "Buzz")]
    [InlineData(15, "FizzBuzz")]
    public void InlineData_FizzBuzz(int input, string expected)
    {
        Calculator.FizzBuzz(input).ShouldBe(expected);
    }

    [Theory]
    [MemberData(nameof(PalindromeData))]
    public void MemberData_Palindrome(string text, bool expected)
    {
        Strings.IsPalindrome(text).ShouldBe(expected);
    }

    public static IEnumerable<object[]> PalindromeData() =>
        new[]
        {
            new object[] { "level", true },
            new object[] { "racecar", true },
            new object[] { "hello", false },
        };

    [Theory]
    [ClassData(typeof(AddCases))]
    public void ClassData_Add(int a, int b, int sum)
    {
        Calculator.Add(a, b).ShouldBe(sum);
    }

    private class AddCases : TheoryData<int, int, int>
    {
        public AddCases()
        {
            Add(1, 2, 3);
            Add(10, 20, 30);
            Add(-1, 1, 0);
        }
    }
}
