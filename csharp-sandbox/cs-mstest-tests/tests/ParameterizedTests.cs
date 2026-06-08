using Microsoft.VisualStudio.TestTools.UnitTesting;
using Sandbox;
using Shouldly;

namespace CsMstestTests;

// Variant: parameterized tests via [DataRow] and [DynamicData].
[TestClass]
public class ParameterizedTests
{
    [TestMethod]
    [DataRow(2)]
    [DataRow(4)]
    [DataRow(100)]
    [DataRow(0)]
    [DataRow(-8)]
    public void DataRow_IsEven(int number)
    {
        Calculator.IsEven(number).ShouldBeTrue();
    }

    [TestMethod]
    [DataRow(1, "1")]
    [DataRow(3, "Fizz")]
    [DataRow(5, "Buzz")]
    [DataRow(15, "FizzBuzz")]
    public void DataRow_FizzBuzz(int input, string expected)
    {
        Calculator.FizzBuzz(input).ShouldBe(expected);
    }

    [TestMethod]
    [DynamicData(nameof(PalindromeData))]
    public void DynamicData_Palindrome(string text, bool expected)
    {
        Strings.IsPalindrome(text).ShouldBe(expected);
    }

    public static IEnumerable<object[]> PalindromeData()
    {
        yield return new object[] { "level", true };
        yield return new object[] { "racecar", true };
        yield return new object[] { "hello", false };
    }
}
