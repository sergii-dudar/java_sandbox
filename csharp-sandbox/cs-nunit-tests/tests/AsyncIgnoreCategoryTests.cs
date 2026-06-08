using NUnit.Framework;
using Sandbox;
using Shouldly;

namespace CsNunitTests;

// Variant: async tests, ignoring, categories, repetition and combinatorial.
[TestFixture]
[Category("fast")]
public class AsyncIgnoreCategoryTests
{
    [Test]
    public async Task AsyncAwait()
    {
        var value = await ComputeAsync(20, 22);
        value.ShouldBe(42);
    }

    [Test]
    public async Task TaskReturningAssertion()
    {
        await Task.Delay(5);
        Calculator.FizzBuzz(15).ShouldBe("FizzBuzz");
    }

    [Test]
    [Ignore("demonstrates an unconditionally ignored test")]
    public void AlwaysIgnored()
    {
        throw new Exception("never executed");
    }

    [Test]
    [Category("smoke")]
    public void TaggedSmoke()
    {
        Calculator.Add(40, 2).ShouldBe(42);
    }

    // [Repeat] runs the same test multiple times.
    [Test]
    [Repeat(5)]
    public void RepeatedTest()
    {
        Calculator.Add(2, 2).ShouldBe(4);
    }

    // Conditional skip at runtime via Assert.Ignore.
    [Test]
    public void ConditionalSkip()
    {
        if (Environment.GetEnvironmentVariable("ENV") != "CI")
        {
            Assert.Ignore("only runs in CI");
        }

        throw new Exception("never reached locally");
    }

    private static async Task<int> ComputeAsync(int a, int b)
    {
        await Task.Yield();
        return Calculator.Add(a, b);
    }
}
