using Microsoft.VisualStudio.TestTools.UnitTesting;
using Sandbox;
using Shouldly;

namespace CsMstestTests;

// Variant: lifecycle hooks.
//   [ClassInitialize]/[ClassCleanup] — once per class (static)
//   [TestInitialize]/[TestCleanup]   — before/after each test
[TestClass]
public class LifecycleTests
{
    private static readonly List<string> Events = new();
    private BankAccount _account = null!;

    [ClassInitialize]
    public static void ClassInitialize(TestContext context) => Events.Add("classInitialize");

    [ClassCleanup]
    public static void ClassCleanup() => Events.Add("classCleanup");

    [TestInitialize]
    public void TestInitialize()
    {
        _account = new BankAccount(100);
        Events.Add("testInitialize");
    }

    [TestCleanup]
    public void TestCleanup() => Events.Add("testCleanup");

    [TestMethod]
    public void FreshAccountEachTest()
    {
        _account.Balance.ShouldBe(100m);
        _account.Deposit(50);
        _account.Balance.ShouldBe(150m);
    }

    [TestMethod]
    public void AnotherTestStartsFresh()
    {
        _account.Balance.ShouldBe(100m);
        Events.ShouldContain("classInitialize");
        Events.ShouldContain("testInitialize");
    }
}
