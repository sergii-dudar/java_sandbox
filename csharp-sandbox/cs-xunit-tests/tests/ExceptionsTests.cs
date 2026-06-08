using Sandbox;
using Shouldly;
using Xunit;

namespace CsXunitTests;

// Variant: exception assertions with Shouldly's Should.Throw.
public class ExceptionsTests
{
    [Fact]
    public void ThrowsOnDivisionByZero()
    {
        var ex = Should.Throw<ArgumentException>(() => Calculator.Divide(10, 0));
        ex.Message.ShouldContain("division by zero");
    }

    [Fact]
    public void ThrowsOnOverdraw()
    {
        var account = new BankAccount(10);

        Should.Throw<InvalidOperationException>(() => account.Withdraw(50))
            .Message.ShouldBe("insufficient funds");
    }

    [Fact]
    public void ThrowsOnNegativeDeposit()
    {
        var account = new BankAccount(0);

        Should.Throw<ArgumentException>(() => account.Deposit(-5));
    }

    [Fact]
    public void DoesNotThrowOnHappyPath()
    {
        var account = new BankAccount(20);

        Should.NotThrow(() => account.Withdraw(5));
        account.Balance.ShouldBe(15m);
    }

    [Fact]
    public async Task ThrowsAsync()
    {
        await Should.ThrowAsync<ArgumentException>(async () =>
        {
            await Task.Yield();
            Calculator.Divide(1, 0);
        });
    }
}
