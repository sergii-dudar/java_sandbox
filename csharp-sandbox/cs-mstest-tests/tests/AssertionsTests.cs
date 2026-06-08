using Microsoft.VisualStudio.TestTools.UnitTesting;
using Sandbox;
using Shouldly;

namespace CsMstestTests;

// Variant: core Shouldly fluent assertions on numbers, strings and collections.
[TestClass]
public class AssertionsTests
{
    [TestMethod]
    public void NumberAssertions()
    {
        var result = Calculator.Add(2, 3);

        result.ShouldBe(5);
        result.ShouldBePositive();
        result.ShouldBeGreaterThan(4);
        result.ShouldBeLessThanOrEqualTo(5);
    }

    [TestMethod]
    public void BooleanAssertions()
    {
        Calculator.IsEven(4).ShouldBeTrue();
        Calculator.IsEven(5).ShouldBeFalse();
    }

    [TestMethod]
    public void StringAssertions()
    {
        var greeting = Strings.SayHi("Alice");

        greeting.ShouldBe("Hi, Alice!");
        greeting.ShouldStartWith("Hi,");
        greeting.ShouldEndWith("!");
        greeting.ShouldContain("Alice");
        greeting.Length.ShouldBe(10);
        greeting.ShouldMatch("Hi, [A-Z][a-z]+!");
    }

    [TestMethod]
    public void CollectionAssertions()
    {
        var words = Strings.Words("the quick brown fox");

        words.Count.ShouldBe(4);
        words.ShouldBe(new[] { "the", "quick", "brown", "fox" });
        words.ShouldContain("brown");
        words.ShouldNotContain("lazy");
        words.ShouldAllBe(w => w.Length > 0);
    }

    [TestMethod]
    public void ApproximateAndNullChecks()
    {
        (0.1 + 0.2).ShouldBe(0.3, tolerance: 1e-9);

        string? nothing = null;
        nothing.ShouldBeNull();
        "x".ShouldNotBeNull();
    }
}
