//! `test-case` advanced matchers: `matches`, `panics`, and `inconclusive`.
//!
//! These produce specially-named generated tests (e.g. `..::panics_on_zero`)
//! that a result-parsing framework needs to be aware of.

use crate::math::*;
use test_case::test_case;

// `=> matches <pattern>` — assert the return value matches a pattern.
#[test_case(10, 2 => matches Ok(5))]
#[test_case(10, 3 => matches Ok(3))]
#[test_case(10, 0 => matches Err(_))]
fn div_matches(a: i64, b: i64) -> Result<i64, String> {
    div(a, b)
}

// `=> panics` — assert the test body panics. The string is matched
// against the panic message (like `#[should_panic(expected = "..")]`).
#[test_case(0 => panics "division by zero" ; "explicit zero")]
fn div_unwrap_panics(divisor: i64) {
    let _ = div(1, divisor).unwrap();
}

// `=> inconclusive` — mark as skipped at runtime (reported as ignored).
#[test_case(2  => inconclusive true  ; "two is too easy")]
#[test_case(13 => true               ; "thirteen is prime")]
#[test_case(15 => false              ; "fifteen is composite")]
fn is_prime_with_inconclusive(n: u64) -> bool {
    is_prime(n)
}

// `=> with |v| { .. }` — custom assertion closure on the return value.
#[test_case(4   => with |v: u64| assert!(v >= 24); "factorial 4 at least 24")]
#[test_case(5   => with |v: u64| assert_eq!(v, 120); "factorial 5 is 120")]
#[test_case(10  => with |v: u64| assert!(v > 1_000_000); "factorial 10 is large")]
fn factorial_with_closure(n: u32) -> u64 {
    factorial(n)
}

// `=> ignore <pattern>` — pattern match but mark `#[ignore]`.
#[test_case(1_000_003 => ignore matches true ; "slow prime check")]
fn slow_prime_ignored(n: u64) -> bool {
    is_prime(n)
}
