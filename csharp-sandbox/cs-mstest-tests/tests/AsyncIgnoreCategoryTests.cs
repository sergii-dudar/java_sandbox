using Microsoft.VisualStudio.TestTools.UnitTesting;
using Sandbox;
using Shouldly;

namespace CsMstestTests;

// Variant: async tests, ignoring, and categories (test properties) for filtering.
[TestClass]
[TestCategory("fast")]
public class AsyncIgnoreCategoryTests
{
    [TestMethod]
    public async Task AsyncAwait()
    {
        var value = await ComputeAsync(20, 22);
        value.ShouldBe(42);
    }

    [TestMethod]
    public async Task TaskReturningAssertion()
    {
        await Task.Delay(5);
        Calculator.FizzBuzz(15).ShouldBe("FizzBuzz");
    }

    [TestMethod]
    [Ignore("demonstrates an unconditionally ignored test")]
    public void AlwaysIgnored()
    {
        throw new Exception("never executed");
    }

    [TestMethod]
    [TestCategory("smoke")]
    public void TaggedSmoke()
    {
        Calculator.Add(40, 2).ShouldBe(42);
    }

    // Conditional skip at runtime via Assert.Inconclusive.
    [TestMethod]
    public void ConditionalSkip()
    {
        if (Environment.GetEnvironmentVariable("ENV") != "CI")
        {
            Assert.Inconclusive("only runs in CI");
        }

        throw new Exception("never reached locally");
    }

    private static async Task<int> ComputeAsync(int a, int b)
    {
        await Task.Yield();
        return Calculator.Add(a, b);
    }
}
