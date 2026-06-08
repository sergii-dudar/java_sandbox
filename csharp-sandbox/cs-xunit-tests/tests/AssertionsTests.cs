using Sandbox;
using Shouldly;
using Xunit;

namespace CsXunitTests;

// Variant: core Shouldly fluent assertions on numbers, strings and collections.
public class AssertionsTests
{
    [Fact]
    public void NumberAssertions()
    {
        var result = Calculator.Add(2, 3);

        result.ShouldBe(5);
        result.ShouldBePositive();
        result.ShouldBeGreaterThan(4);
        result.ShouldBeLessThanOrEqualTo(5);
    }

    [Fact]
    public void BooleanAssertions()
    {
        Calculator.IsEven(4).ShouldBeTrue();
        Calculator.IsEven(5).ShouldBeFalse();
    }

    [Fact]
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

    [Fact]
    public void CollectionAssertions()
    {
        var words = Strings.Words("the quick brown fox");

        words.Count.ShouldBe(4);
        words.ShouldBe(new[] { "the", "quick", "brown", "fox" });
        words.ShouldContain("brown");
        words.ShouldNotContain("lazy");
        words.ShouldAllBe(w => w.Length > 0);
    }

    [Fact]
    public void ApproximateAndNullChecks()
    {
        (0.1 + 0.2).ShouldBe(0.3, tolerance: 1e-9);

        string? nothing = null;
        nothing.ShouldBeNull();
        "x".ShouldNotBeNull();
    }
}
