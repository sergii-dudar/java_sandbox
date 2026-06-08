using Microsoft.VisualStudio.TestTools.UnitTesting;
using Sandbox;
using Shouldly;

namespace CsMstestTests;

// Variant: exception assertions with Shouldly's Should.Throw.
[TestClass]
public class ExceptionsTests
{
    [TestMethod]
    public void ThrowsOnDivisionByZero()
    {
        var ex = Should.Throw<ArgumentException>(() => Calculator.Divide(10, 0));
        ex.Message.ShouldContain("division by zero");
    }

    [TestMethod]
    public void ThrowsOnOverdraw()
    {
        var account = new BankAccount(10);

        Should.Throw<InvalidOperationException>(() => account.Withdraw(50))
            .Message.ShouldBe("insufficient funds");
    }

    [TestMethod]
    public void ThrowsOnNegativeDeposit()
    {
        var account = new BankAccount(0);

        Should.Throw<ArgumentException>(() => account.Deposit(-5));
    }

    [TestMethod]
    public void DoesNotThrowOnHappyPath()
    {
        var account = new BankAccount(20);

        Should.NotThrow(() => account.Withdraw(5));
        account.Balance.ShouldBe(15m);
    }

    [TestMethod]
    public async Task ThrowsAsync()
    {
        await Should.ThrowAsync<ArgumentException>(async () =>
        {
            await Task.Yield();
            Calculator.Divide(1, 0);
        });
    }
}
