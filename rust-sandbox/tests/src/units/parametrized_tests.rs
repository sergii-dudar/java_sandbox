//! Parametrized test examples using `rstest` and `test-case`.
//!
//! These illustrate several styles of data-driven testing in Rust:
//!   * `#[case(..)]` argument tables via `rstest`
//!   * `#[values(..)]` cartesian products
//!   * fixtures (`#[fixture]`) shared across tests
//!   * `#[test_case(..)]` attribute-style cases via `test-case`
//!   * `should_panic`, `#[ignore]`, and `Result`-returning parametrized tests

use crate::math::*;
use crate::strings::*;

use rstest::{fixture, rstest};
use test_case::test_case;

// -----------------------------------------------------------------------------
// rstest: simple value table
// -----------------------------------------------------------------------------

#[rstest]
#[case(2, 3, 5)]
#[case(-1, 1, 0)]
#[case(0, 0, 0)]
#[case(100, 250, 350)]
fn add_table(#[case] a: i64, #[case] b: i64, #[case] expected: i64) {
    assert_eq!(add(a, b), expected);
}

#[rstest]
#[case(0, 1)]
#[case(1, 1)]
#[case(5, 120)]
#[case(10, 3_628_800)]
fn factorial_table(#[case] n: u32, #[case] expected: u64) {
    assert_eq!(factorial(n), expected);
}

#[rstest]
#[case(0, 0)]
#[case(1, 1)]
#[case(2, 1)]
#[case(7, 13)]
#[case(10, 55)]
fn fibonacci_table(#[case] n: u32, #[case] expected: u64) {
    assert_eq!(fibonacci(n), expected);
}

// -----------------------------------------------------------------------------
// rstest: #[values] - cartesian product of inputs
// -----------------------------------------------------------------------------

#[rstest]
fn add_is_commutative(
    #[values(-5, 0, 1, 42)] a: i64,
    #[values(-10, 0, 7, 99)] b: i64,
) {
    assert_eq!(add(a, b), add(b, a));
}

// -----------------------------------------------------------------------------
// rstest: combined #[case] + #[values]
// -----------------------------------------------------------------------------

#[rstest]
#[case("racecar", true)]
#[case("hello", false)]
fn palindrome_with_extra_inputs(
    #[case] word: &str,
    #[case] expected: bool,
    #[values(true, false)] _flag: bool,
) {
    assert_eq!(is_palindrome(word), expected);
}

// -----------------------------------------------------------------------------
// rstest: fixtures
// -----------------------------------------------------------------------------

#[fixture]
fn small_primes() -> Vec<u64> {
    vec![2, 3, 5, 7, 11, 13, 17, 19]
}

#[rstest]
fn all_small_primes_are_prime(small_primes: Vec<u64>) {
    for p in small_primes {
        assert!(is_prime(p), "{p} should be prime");
    }
}

#[rstest]
fn gcd_of_primes_is_one(small_primes: Vec<u64>) {
    for w in small_primes.windows(2) {
        assert_eq!(gcd(w[0], w[1]), 1);
    }
}

// -----------------------------------------------------------------------------
// rstest: should_panic / ignore / Result
// -----------------------------------------------------------------------------

#[rstest]
#[case(1)]
#[case(2)]
#[case(100)]
#[should_panic(expected = "division by zero")]
fn div_zero_panics_for_any_dividend(#[case] a: i64) {
    div(a, 0).expect("division by zero");
}

#[rstest]
#[case(20, 4, 5)]
#[case(100, 10, 10)]
fn div_returning_result(
    #[case] a: i64,
    #[case] b: i64,
    #[case] expected: i64,
) -> Result<(), String> {
    assert_eq!(div(a, b)?, expected);
    Ok(())
}

#[rstest]
#[case(1_000_003)]
#[case(1_000_033)]
#[ignore = "slow primality demo"]
fn slow_large_primes(#[case] n: u64) {
    assert!(is_prime(n));
}

// -----------------------------------------------------------------------------
// test-case: attribute style
// -----------------------------------------------------------------------------

#[test_case("hello",  "HELLO" ; "lowercase word")]
#[test_case("Rust",   "RUST"  ; "mixed case")]
#[test_case("",       ""      ; "empty string")]
#[test_case("123abc", "123ABC"; "alphanumeric")]
fn shout_cases(input: &str, expected: &str) {
    assert_eq!(shout(input), expected);
}

#[test_case("rust"    => "Rust"    ; "single word")]
#[test_case("hello"   => "Hello"   ; "lowercase")]
#[test_case(""        => ""        ; "empty stays empty")]
#[test_case("already" => "Already" ; "already lowercase")]
fn capitalize_cases(input: &str) -> String {
    capitalize(input)
}

#[test_case(0   => false ; "zero is not prime")]
#[test_case(1   => false ; "one is not prime")]
#[test_case(2   => true  ; "two is prime")]
#[test_case(9   => false ; "nine is composite")]
#[test_case(13  => true  ; "thirteen is prime")]
#[test_case(100 => false ; "hundred is composite")]
fn is_prime_cases(n: u64) -> bool {
    is_prime(n)
}

#[test_case("hello world"            => 2)]
#[test_case("  many   spaces   here" => 3)]
#[test_case(""                       => 0)]
#[test_case("one"                    => 1)]
fn word_count_cases(s: &str) -> usize {
    word_count(s)
}
