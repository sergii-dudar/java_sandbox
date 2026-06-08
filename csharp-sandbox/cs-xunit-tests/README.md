# xUnit examples (C#) — all variants

A self-contained **xUnit** test project (.NET 10) demonstrating every major
xUnit testing "variant", with all checks written using
[Shouldly](https://docs.shouldly.org/) fluent assertions.

It is one of three sibling C# suites (`cs-xunit-tests`, `cs-nunit-tests`,
`cs-mstest-tests`) with identical source/tests but different frameworks, and
mirrors the Java/JS/TS/Python/Rust/Go/Lua suites elsewhere in this repo.

- **Framework:** xUnit 2.9
- **Assertions:** Shouldly 4.3 (fluent, free — the closest parallel to AssertJ)
- **Target:** net10.0

## Layout

```
cs-xunit-tests/
├── CsXunitTests.csproj        # framework + Shouldly package references
├── src/                       # "system under test"
│   ├── Calculator.cs          # Add / Divide / IsEven / FizzBuzz
│   ├── Strings.cs             # SayHi / Slugify / Reverse / IsPalindrome / Words
│   └── BankAccount.cs         # Deposit / Withdraw (throws)
└── tests/
    ├── AssertionsTests.cs        # Shouldly number/string/collection/null + tolerance
    ├── ExceptionsTests.cs        # Should.Throw / Should.NotThrow / Should.ThrowAsync
    ├── ParameterizedTests.cs     # [Theory] + [InlineData]/[MemberData]/[ClassData]
    ├── LifecycleTests.cs         # constructor + IDisposable + IAsyncLifetime
    ├── ClassFixtureTests.cs      # IClassFixture<T> shared context
    └── AsyncSkipTraitTests.cs    # async, [Fact(Skip=...)], [Trait] categories
```

## Variants covered

| Area | xUnit / Shouldly feature | Where |
|------|--------------------------|-------|
| Fluent assertions | `ShouldBe`, `ShouldStartWith`, `ShouldContain`, `ShouldAllBe`, tolerance | `AssertionsTests.cs` |
| Exceptions | `Should.Throw<T>`, `Should.NotThrow`, `Should.ThrowAsync<T>` | `ExceptionsTests.cs` |
| Parameterized | `[Theory]` with `[InlineData]`, `[MemberData]`, `[ClassData]` / `TheoryData` | `ParameterizedTests.cs` |
| Lifecycle | constructor (setup), `IDisposable` (teardown), `IAsyncLifetime` | `LifecycleTests.cs` |
| Shared context | `IClassFixture<T>` | `ClassFixtureTests.cs` |
| Async | `async Task` test methods | `AsyncSkipTraitTests.cs` |
| Skipping | `[Fact(Skip = "...")]` | `AsyncSkipTraitTests.cs` |
| Categories | `[Trait("Category", "...")]` | `AsyncSkipTraitTests.cs` |

## Running

```bash
cd cs-xunit-tests

dotnet test                                              # run everything
dotnet test --filter "Category=smoke"                   # only smoke-tagged
dotnet test --filter "Category=fast"                    # only fast-tagged
dotnet test --filter "FullyQualifiedName~Parameterized" # by class/name
dotnet test -v n                                        # normal verbosity
```

## Expected result

```
Passed!  -  Failed: 0, Passed: 33, Skipped: 1, Total: 34
```

The single skipped test is intentional (`[Fact(Skip = ...)]`).
