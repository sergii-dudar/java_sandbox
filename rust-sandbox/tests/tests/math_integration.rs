use test1::math::*;

#[test]
fn add_and_sub_integration() {
    assert_eq!(add(2, 3), 5);
    assert_eq!(sub(10, 7), 3);
}

#[test]
fn fibonacci_matches_known_values() {
    let expected = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34];
    for (i, e) in expected.iter().enumerate() {
        assert_eq!(fibonacci(i as u32), *e, "fib({i})");
    }
}

#[test]
fn primes_under_20() {
    let primes: Vec<u64> = (0..20).filter(|n| is_prime(*n)).collect();
    assert_eq!(primes, vec![2, 3, 5, 7, 11, 13, 17, 19]);
}

#[test]
fn gcd_and_factorial_combo() {
    assert_eq!(gcd(factorial(5), factorial(4)), factorial(4));
}

#[test]
#[should_panic]
fn div_unwrap_on_zero_panics() {
    let _ = div(1, 0).unwrap();
}
