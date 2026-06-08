# NUnit examples (C#) — all variants

A self-contained **NUnit** test project (.NET 10) demonstrating every major
NUnit testing "variant", with all checks written using
[Shouldly](https://docs.shouldly.org/) fluent assertions.

It is one of three sibling C# suites (`cs-xunit-tests`, `cs-nunit-tests`,
`cs-mstest-tests`) with identical source/tests but different frameworks, and
mirrors the Java/JS/TS/Python/Rust/Go/Lua suites elsewhere in this repo.

- **Framework:** NUnit 4.3
- **Assertions:** Shouldly 4.3 (fluent, free — the closest parallel to AssertJ)
- **Target:** net10.0

## Layout

```
cs-nunit-tests/
├── CsNunitTests.csproj        # framework + Shouldly package references
├── src/                       # "system under test"
│   ├── Calculator.cs          # Add / Divide / IsEven / FizzBuzz
│   ├── Strings.cs             # SayHi / Slugify / Reverse / IsPalindrome / Words
│   └── BankAccount.cs         # Deposit / Withdraw (throws)
└── tests/
    ├── AssertionsTests.cs            # Shouldly number/string/collection/null + tolerance
    ├── ExceptionsTests.cs            # Should.Throw / Should.NotThrow / Should.ThrowAsync
    ├── ParameterizedTests.cs         # [TestCase]/[TestCaseSource]/[Values]/[Range]
    ├── LifecycleTests.cs             # [OneTimeSetUp]/[SetUp]/[TearDown]/[OneTimeTearDown]
    └── AsyncIgnoreCategoryTests.cs   # async, [Ignore], [Category], [Repeat], Assert.Ignore
```

## Variants covered

| Area | NUnit / Shouldly feature | Where |
|------|--------------------------|-------|
| Fluent assertions | `ShouldBe`, `ShouldStartWith`, `ShouldContain`, `ShouldAllBe`, tolerance | `AssertionsTests.cs` |
| Exceptions | `Should.Throw<T>`, `Should.NotThrow`, `Should.ThrowAsync<T>` | `ExceptionsTests.cs` |
| Parameterized | `[TestCase]` (+ `ExpectedResult`), `[TestCaseSource]`, `[Values]`, `[Range]` | `ParameterizedTests.cs` |
| Lifecycle | `[OneTimeSetUp]`/`[SetUp]`/`[TearDown]`/`[OneTimeTearDown]` | `LifecycleTests.cs` |
| Async | `async Task` test methods | `AsyncIgnoreCategoryTests.cs` |
| Ignoring | `[Ignore("...")]`, runtime `Assert.Ignore` | `AsyncIgnoreCategoryTests.cs` |
| Categories | `[Category("...")]` | `AsyncIgnoreCategoryTests.cs` |
| Repetition | `[Repeat(n)]` | `AsyncIgnoreCategoryTests.cs` |

## Running

```bash
cd cs-nunit-tests

dotnet test                                              # run everything
dotnet test --filter "TestCategory=smoke"               # only smoke-tagged
dotnet test --filter "TestCategory=fast"                # only fast-tagged
dotnet test --filter "FullyQualifiedName~Parameterized" # by class/name
dotnet test -v n                                        # normal verbosity
```

## Expected result

```
Passed!  -  Failed: 0, Passed: 35, Skipped: 2, Total: 37
```

The two skipped tests are intentional (`[Ignore]` and the runtime
`Assert.Ignore` that only proceeds in CI).
