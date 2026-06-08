using Sandbox;
using Shouldly;
using Xunit;

namespace CsXunitTests;

// Variant: lifecycle. In xUnit the constructor runs before each test and
// Dispose() runs after each test (a fresh instance is created per test).
public class LifecycleTests : IDisposable
{
    private readonly List<string> _events = new();
    private BankAccount _account;

    public LifecycleTests()
    {
        // Equivalent to a per-test "set up".
        _account = new BankAccount(100);
        _events.Add("ctor");
    }

    public void Dispose()
    {
        // Equivalent to a per-test "tear down".
        _events.Add("dispose");
    }

    [Fact]
    public void FreshAccountEachTest()
    {
        _account.Balance.ShouldBe(100m);
        _account.Deposit(50);
        _account.Balance.ShouldBe(150m);
    }

    [Fact]
    public void AnotherTestStartsFresh()
    {
        // A new instance => the deposit from the other test is not visible.
        _account.Balance.ShouldBe(100m);
        _events.ShouldContain("ctor");
    }
}

// Variant: async lifecycle via IAsyncLifetime (InitializeAsync / DisposeAsync).
public class AsyncLifecycleTests : IAsyncLifetime
{
    private string _state = "uninitialized";

    public async Task InitializeAsync()
    {
        await Task.Yield();
        _state = "initialized";
    }

    public Task DisposeAsync() => Task.CompletedTask;

    [Fact]
    public void StateWasInitializedAsync()
    {
        _state.ShouldBe("initialized");
    }
}
