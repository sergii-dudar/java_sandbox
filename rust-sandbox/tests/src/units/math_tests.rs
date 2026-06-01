use crate::math::*;

#[test]
fn add_works() {
    assert_eq!(add(2, 3), 5);
}

#[test]
fn add_negative() {
    assert_eq!(add(-2, -3), -5);
}

#[test]
fn sub_works() {
    assert_eq!(sub(10, 4), 6);
}

#[test]
fn mul_works() {
    assert_eq!(mul(6, 7), 42);
}

#[test]
fn div_ok() {
    assert_eq!(div(10, 2), Ok(5));
}

#[test]
fn div_by_zero_is_err() {
    assert!(div(1, 0).is_err());
}

#[test]
fn factorial_base_cases() {
    assert_eq!(factorial(0), 1);
    assert_eq!(factorial(1), 1);
}

#[test]
fn factorial_values() {
    assert_eq!(factorial(5), 120);
    assert_eq!(factorial(10), 3_628_800);
}

#[test]
fn fibonacci_sequence() {
    let seq: Vec<u64> = (0..8).map(fibonacci).collect();
    assert_eq!(seq, vec![0, 1, 1, 2, 3, 5, 8, 13]);
}

#[test]
fn is_prime_small() {
    assert!(!is_prime(0));
    assert!(!is_prime(1));
    assert!(is_prime(2));
    assert!(is_prime(3));
    assert!(!is_prime(4));
    assert!(is_prime(13));
}

#[test]
fn is_prime_large() {
    assert!(is_prime(7919));
    assert!(!is_prime(7920));
}

#[test]
fn gcd_works() {
    assert_eq!(gcd(54, 24), 6);
    assert_eq!(gcd(17, 5), 1);
}

#[test]
#[should_panic(expected = "attempt to multiply with overflow")]
fn mul_overflows_on_debug() {
    let _ = mul(i64::MAX, 2);
}

#[test]
#[ignore = "slow demo test"]
fn slow_prime_check() {
    assert!(is_prime(1_000_003));
}

#[test]
fn returning_result() -> Result<(), String> {
    let q = div(20, 4)?;
    assert_eq!(q, 5);
    Ok(())
}
