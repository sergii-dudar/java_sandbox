using NUnit.Framework;
using Sandbox;
using Shouldly;

namespace CsNunitTests;

// Variant: parameterized tests via NUnit's many mechanisms.
[TestFixture]
public class ParameterizedTests
{
    // [TestCase] — inline arguments, one attribute per case.
    [TestCase(2)]
    [TestCase(4)]
    [TestCase(100)]
    [TestCase(0)]
    [TestCase(-8)]
    public void TestCase_IsEven(int number)
    {
        Calculator.IsEven(number).ShouldBeTrue();
    }

    // [TestCase] with an expected result via ExpectedResult.
    [TestCase(1, ExpectedResult = "1")]
    [TestCase(3, ExpectedResult = "Fizz")]
    [TestCase(5, ExpectedResult = "Buzz")]
    [TestCase(15, ExpectedResult = "FizzBuzz")]
    public string TestCase_FizzBuzz(int input)
    {
        return Calculator.FizzBuzz(input);
    }

    // [TestCaseSource] — cases supplied by a static member.
    [TestCaseSource(nameof(PalindromeCases))]
    public void TestCaseSource_Palindrome(string text, bool expected)
    {
        Strings.IsPalindrome(text).ShouldBe(expected);
    }

    private static readonly object[] PalindromeCases =
    {
        new object[] { "level", true },
        new object[] { "racecar", true },
        new object[] { "hello", false },
    };

    // [Values] — NUnit builds the cartesian product of the parameter values.
    [Test]
    public void Values_CombinatorialIsEven([Values(2, 4, 6)] int even)
    {
        Calculator.IsEven(even).ShouldBeTrue();
    }

    // [Range] generates a sequence of values.
    [Test]
    public void Range_AddsCorrectly([Range(0, 3)] int n)
    {
        Calculator.Add(n, 0).ShouldBe(n);
    }
}
