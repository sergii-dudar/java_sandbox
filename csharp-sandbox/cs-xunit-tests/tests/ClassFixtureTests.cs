using Sandbox;
using Shouldly;
using Xunit;

namespace CsXunitTests;

// Variant: shared context across tests in a class via IClassFixture.
// The fixture is created once and injected into the test class constructor.
public class DatabaseFixture : IDisposable
{
    public DatabaseFixture() => ConnectionId = Guid.NewGuid().ToString();

    public string ConnectionId { get; }

    public void Dispose()
    {
        // Clean up the shared resource once, after all tests in the class.
    }
}

public class ClassFixtureTests : IClassFixture<DatabaseFixture>
{
    private readonly DatabaseFixture _fixture;

    public ClassFixtureTests(DatabaseFixture fixture) => _fixture = fixture;

    [Fact]
    public void FixtureIsInjected()
    {
        _fixture.ConnectionId.ShouldNotBeNullOrEmpty();
    }

    [Fact]
    public void SameFixtureInstanceIsShared()
    {
        _fixture.ConnectionId.ShouldNotBeNull();
    }
}
