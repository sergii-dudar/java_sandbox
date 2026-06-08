using Sandbox;
using Shouldly;
using Xunit;

namespace CsXunitTests;

// Variant: async tests, skipping, and traits (categories) for filtering.
[Trait("Category", "fast")]
public class AsyncSkipTraitTests
{
    [Fact]
    public async Task AsyncAwait()
    {
        var value = await ComputeAsync(20, 22);
        value.ShouldBe(42);
    }

    [Fact]
    public async Task TaskReturningAssertion()
    {
        await Task.Delay(5);
        Calculator.FizzBuzz(15).ShouldBe("FizzBuzz");
    }

    [Fact(Skip = "demonstrates an unconditionally skipped test")]
    public void AlwaysSkipped()
    {
        throw new Exception("never executed");
    }

    [Fact]
    [Trait("Category", "smoke")]
    public void TaggedSmoke()
    {
        Calculator.Add(40, 2).ShouldBe(42);
    }

    private static async Task<int> ComputeAsync(int a, int b)
    {
        await Task.Yield();
        return Calculator.Add(a, b);
    }
}
