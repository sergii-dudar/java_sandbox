//! Property-based tests using `quickcheck`.
//!
//! Compared to `proptest`, quickcheck:
//!   * uses the `Arbitrary` trait to generate inputs,
//!   * uses simpler `bool` / `TestResult` return values,
//!   * has its own (different) failure output the test framework parses.

use crate::math::*;
use crate::strings::*;
use quickcheck::TestResult;
use quickcheck_macros::quickcheck;

#[quickcheck]
fn qc_add_commutative(a: i32, b: i32) -> bool {
    add(a as i64, b as i64) == add(b as i64, a as i64)
}

#[quickcheck]
fn qc_mul_distributes_over_add(a: i16, b: i16, c: i16) -> bool {
    let (a, b, c) = (a as i64, b as i64, c as i64);
    mul(a, add(b, c)) == add(mul(a, b), mul(a, c))
}

#[quickcheck]
fn qc_gcd_symmetric(a: u32, b: u32) -> TestResult {
    if a == 0 || b == 0 {
        return TestResult::discard();
    }
    TestResult::from_bool(gcd(a as u64, b as u64) == gcd(b as u64, a as u64))
}

#[quickcheck]
fn qc_reverse_preserves_length(s: String) -> bool {
    reverse(&s).chars().count() == s.chars().count()
}

#[quickcheck]
fn qc_double_reverse_is_identity(s: String) -> bool {
    reverse(&reverse(&s)) == s
}

#[quickcheck]
fn qc_shout_is_idempotent(s: String) -> bool {
    shout(&shout(&s)) == shout(&s)
}
