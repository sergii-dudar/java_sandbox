# MSTest examples (C#) — all variants

A self-contained **MSTest** test project (.NET 10) demonstrating every major
MSTest testing "variant", with all checks written using
[Shouldly](https://docs.shouldly.org/) fluent assertions.

It is one of three sibling C# suites (`cs-xunit-tests`, `cs-nunit-tests`,
`cs-mstest-tests`) with identical source/tests but different frameworks, and
mirrors the Java/JS/TS/Python/Rust/Go/Lua suites elsewhere in this repo.

- **Framework:** MSTest 4.0
- **Assertions:** Shouldly 4.3 (fluent, free — the closest parallel to AssertJ)
- **Target:** net10.0

## Layout

```
cs-mstest-tests/
├── CsMstestTests.csproj       # framework + Shouldly package references
├── MSTestSettings.cs          # MSTest runner configuration (generated)
├── src/                       # "system under test"
│   ├── Calculator.cs          # Add / Divide / IsEven / FizzBuzz
│   ├── Strings.cs             # SayHi / Slugify / Reverse / IsPalindrome / Words
│   └── BankAccount.cs         # Deposit / Withdraw (throws)
└── tests/
    ├── AssertionsTests.cs            # Shouldly number/string/collection/null + tolerance
    ├── ExceptionsTests.cs            # Should.Throw / Should.NotThrow / Should.ThrowAsync
    ├── ParameterizedTests.cs         # [DataRow] + [DynamicData]
    ├── LifecycleTests.cs             # [ClassInitialize]/[TestInitialize]/[TestCleanup]/[ClassCleanup]
    └── AsyncIgnoreCategoryTests.cs   # async, [Ignore], [TestCategory], Assert.Inconclusive
```

## Variants covered

| Area | MSTest / Shouldly feature | Where |
|------|---------------------------|-------|
| Fluent assertions | `ShouldBe`, `ShouldStartWith`, `ShouldContain`, `ShouldAllBe`, tolerance | `AssertionsTests.cs` |
| Exceptions | `Should.Throw<T>`, `Should.NotThrow`, `Should.ThrowAsync<T>` | `ExceptionsTests.cs` |
| Parameterized | `[DataRow]`, `[DynamicData]` | `ParameterizedTests.cs` |
| Lifecycle | `[ClassInitialize]`/`[TestInitialize]`/`[TestCleanup]`/`[ClassCleanup]` | `LifecycleTests.cs` |
| Async | `async Task` test methods | `AsyncIgnoreCategoryTests.cs` |
| Ignoring | `[Ignore("...")]`, runtime `Assert.Inconclusive` | `AsyncIgnoreCategoryTests.cs` |
| Categories | `[TestCategory("...")]` | `AsyncIgnoreCategoryTests.cs` |

## Running

```bash
cd cs-mstest-tests

dotnet test                                              # run everything
dotnet test --filter "TestCategory=smoke"               # only smoke-tagged
dotnet test --filter "TestCategory=fast"                # only fast-tagged
dotnet test --filter "FullyQualifiedName~Parameterized" # by class/name
dotnet test -v n                                        # normal verbosity
```

## Expected result

```
Passed!  -  Failed: 0, Passed: 27, Skipped: 2, Total: 29
```

The two skipped tests are intentional (`[Ignore]` and the runtime
`Assert.Inconclusive` that only proceeds in CI).
