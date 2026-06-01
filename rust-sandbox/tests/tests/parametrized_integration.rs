//! Integration-level parametrized tests using `rstest` and `test-case`.

use rstest::rstest;
use test1::math::*;
use test1::strings::*;
use test_case::test_case;

#[rstest]
#[case(0,  0)]
#[case(1,  1)]
#[case(2,  1)]
#[case(3,  2)]
#[case(10, 55)]
#[case(15, 610)]
fn fibonacci_table_integration(#[case] n: u32, #[case] expected: u64) {
    assert_eq!(fibonacci(n), expected);
}

#[rstest]
fn gcd_is_symmetric(
    #[values(1, 6, 24, 100)] a: u64,
    #[values(1, 9, 18, 81)]  b: u64,
) {
    assert_eq!(gcd(a, b), gcd(b, a));
}

#[test_case("A man a plan a canal Panama" => true  ; "classic palindrome phrase")]
#[test_case("No lemon, no melon"          => true  ; "with punctuation")]
#[test_case("rust is fun"                 => false ; "not a palindrome")]
#[test_case(""                            => true  ; "empty string")]
fn palindrome_integration(s: &str) -> bool {
    is_palindrome(s)
}

#[test_case("hello"        => "olleh")]
#[test_case("rust"         => "tsur")]
#[test_case(""             => "")]
#[test_case("a"            => "a")]
#[test_case("ab cd"        => "dc ba")]
fn reverse_integration(s: &str) -> String {
    reverse(s)
}
