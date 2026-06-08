using NUnit.Framework;
using Sandbox;
using Shouldly;

namespace CsNunitTests;

// Variant: lifecycle hooks.
//   [OneTimeSetUp]/[OneTimeTearDown] — once per fixture
//   [SetUp]/[TearDown]               — before/after each test
[TestFixture]
public class LifecycleTests
{
    private readonly List<string> _events = new();
    private BankAccount _account = null!;

    [OneTimeSetUp]
    public void OneTimeSetUp() => _events.Add("oneTimeSetUp");

    [OneTimeTearDown]
    public void OneTimeTearDown() => _events.Add("oneTimeTearDown");

    [SetUp]
    public void SetUp()
    {
        _account = new BankAccount(100);
        _events.Add("setUp");
    }

    [TearDown]
    public void TearDown() => _events.Add("tearDown");

    [Test]
    public void FreshAccountEachTest()
    {
        _account.Balance.ShouldBe(100m);
        _account.Deposit(50);
        _account.Balance.ShouldBe(150m);
    }

    [Test]
    public void AnotherTestStartsFresh()
    {
        _account.Balance.ShouldBe(100m);
        _events.ShouldContain("oneTimeSetUp");
        _events.ShouldContain("setUp");
    }
}
