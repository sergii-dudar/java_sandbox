# JUnit 5/6 examples (Gradle) — all variants

A self-contained **Gradle** project demonstrating every major
[JUnit Jupiter](https://junit.org/junit5/) testing "variant", with all checks
written using [AssertJ](https://assertj.github.io/doc/) fluent assertions.

It is the Gradle counterpart to `java-maven-tests` (identical sources/tests,
different build tool) and mirrors the JS/TS/Python/Rust/Go/Lua suites elsewhere
in this repo.

- **JUnit:** `org.junit:junit-bom:6.1.0` (Jupiter)
- **Assertions:** `org.assertj:assertj-core:3.27.7`
- **Java:** 25 (via a Gradle Java toolchain)
- **Gradle:** 9.5.1 (required to run on JDK 25; the wrapper is committed)

## Layout

```
java-gradle-tests/
├── build.gradle               # plugins, deps (JUnit BOM + AssertJ), test config
├── settings.gradle
├── gradlew / gradlew.bat      # Gradle wrapper (9.5.1)
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
cd java-gradle-tests

./gradlew test               # run all tests (the "slow" tag is excluded by default)
./gradlew test -PincludeSlow # include @Tag("slow") tests
./gradlew smokeTest          # only @Tag("smoke") tests
./gradlew test --tests '*ParameterizedExamplesTest'   # filter by class
./gradlew clean test         # clean rebuild

# open the HTML report afterwards:
#   build/reports/tests/test/index.html
```

> **JDK note:** Gradle must *run* on JDK 25, which requires Gradle ≥ 9.1
> (this project pins 9.5.1 in the wrapper). The build also declares a Java 25
> toolchain, so `./gradlew` uses JDK 25 for compilation and test execution.

## Expected result

All tests pass; two are intentionally skipped (the `assumeTrue`/`assumingThat`
assumptions abort when not running in CI) and the `@Disabled` test is reported
as skipped. The `slow`-tagged test is excluded unless you pass `-PincludeSlow`.
