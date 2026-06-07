# JUnit 5/6 examples (Maven) — all variants

A self-contained **Maven** project demonstrating every major
[JUnit Jupiter](https://junit.org/junit5/) testing "variant", with all checks
written using [AssertJ](https://assertj.github.io/doc/) fluent assertions.

It is the Maven counterpart to `java-gradle-tests` (identical sources/tests,
different build tool) and mirrors the JS/TS/Python/Rust/Go/Lua suites elsewhere
in this repo.

- **JUnit:** `org.junit:junit-bom:6.1.0` (Jupiter)
- **Assertions:** `org.assertj:assertj-core:3.27.7`
- **Java:** 25 (`maven.compiler.release=25`)
- **Surefire:** 3.5.2 (runs the Jupiter tests)

## Layout

```
java-maven-tests/
├── pom.xml                    # JUnit BOM + AssertJ, Surefire config, tag profiles
└── src/
    ├── main/java/com/example/sandbox/
    │   ├── Calculator.java        # add / divide / isEven / fizzbuzz
    │   ├── Strings.java           # sayHi / slugify / reverse / isPalindrome / words
    │   └── BankAccount.java       # deposit / withdraw (throws)
    └── test/java/com/example/sandbox/
        ├── AssertionsTest.java              # AssertJ number/string/list/map + extracting/filtering
        ├── ExceptionsTest.java              # assertThatThrownBy / assertThatExceptionOfType / assertThatCode
        ├── ParameterizedExamplesTest.java   # @ValueSource/@CsvSource/@MethodSource/@EnumSource/@NullAndEmptySource
        ├── LifecycleTest.java               # @BeforeAll/@AfterAll/@BeforeEach/@AfterEach (PER_CLASS)
        ├── NestedTest.java                  # @Nested grouping with @DisplayName
        ├── RepeatedAndTimeoutTest.java      # @RepeatedTest + @Timeout
        ├── DisabledAndAssumptionsTest.java  # @Disabled / @EnabledOnOs / assumeTrue / assumingThat
        ├── DynamicTestsTest.java            # @TestFactory dynamic tests
        └── TagsAndSoftAssertionsTest.java   # @Tag + AssertJ assertSoftly
```

## Variants covered

| Area | JUnit / AssertJ feature | Where |
|------|-------------------------|-------|
| Fluent assertions | AssertJ `assertThat(...)` chains (numbers, strings, lists, maps) | `AssertionsTest.java` |
| Extracting / filtering | `.extracting(...)`, `.filteredOn(...)` | `AssertionsTest.java` |
| Exceptions | `assertThatThrownBy`, `assertThatExceptionOfType`, `assertThatCode` | `ExceptionsTest.java` |
| Parameterized | `@ValueSource`, `@CsvSource`, `@MethodSource`, `@EnumSource`, `@NullAndEmptySource` | `ParameterizedExamplesTest.java` |
| Lifecycle | `@BeforeAll/@AfterAll/@BeforeEach/@AfterEach`, `@TestInstance(PER_CLASS)` | `LifecycleTest.java` |
| Nested grouping | `@Nested`, `@DisplayName` | `NestedTest.java` |
| Repetition / timeout | `@RepeatedTest`, `@Timeout` | `RepeatedAndTimeoutTest.java` |
| Disabling / assumptions | `@Disabled`, `@EnabledOnOs`, `assumeTrue`, `assumingThat` | `DisabledAndAssumptionsTest.java` |
| Dynamic tests | `@TestFactory`, `DynamicTest` | `DynamicTestsTest.java` |
| Tags + soft assertions | `@Tag`, AssertJ `assertSoftly` | `TagsAndSoftAssertionsTest.java` |

## Running

```bash
cd java-maven-tests

mvn test                     # run all tests (the "slow" tag is excluded by default)
mvn test -P all              # include @Tag("slow") tests
mvn test -P smoke            # only @Tag("smoke") tests
mvn test -Dtest=ParameterizedExamplesTest   # filter by class
mvn clean test               # clean rebuild

# Surefire report afterwards:
#   target/surefire-reports/
```

Tag filtering is configured on the Surefire plugin: `slow` is in
`<excludedGroups>` by default, and the `smoke` / `all` Maven profiles override
that selection.

## Expected result

```
Tests run: 52, Failures: 0, Errors: 0, Skipped: 2
BUILD SUCCESS
```

The two skipped tests are intentional (the `assumeTrue`/`assumingThat`
assumptions abort when not running in CI; the `@Disabled` test is also skipped).
The `slow`-tagged test is excluded unless you run `mvn test -P all`.
