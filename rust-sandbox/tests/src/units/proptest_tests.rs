//! Property-based tests using the `proptest` crate.
//!
//! `proptest!` generates random inputs and shrinks failures down to a minimal
//! counter-example. Failing tests print the shrunk input and a persisted
//! regression seed in `proptest-regressions/`.

use crate::math::*;
use crate::strings::*;
use proptest::prelude::*;

proptest! {
    // Number of generated cases per test (default 256).
    #![proptest_config(ProptestConfig { cases: 64, .. ProptestConfig::default() })]

    #[test]
    fn add_is_commutative(a in -1_000_000i64..1_000_000, b in -1_000_000i64..1_000_000) {
        prop_assert_eq!(add(a, b), add(b, a));
    }

    #[test]
    fn add_is_associative(
        a in -10_000i64..10_000,
        b in -10_000i64..10_000,
        c in -10_000i64..10_000,
    ) {
        prop_assert_eq!(add(add(a, b), c), add(a, add(b, c)));
    }

    #[test]
    fn sub_then_add_is_identity(a in -1_000i64..1_000, b in -1_000i64..1_000) {
        prop_assert_eq!(add(sub(a, b), b), a);
    }

    #[test]
    fn gcd_divides_both(a in 1u64..10_000, b in 1u64..10_000) {
        let g = gcd(a, b);
        prop_assert!(g >= 1);
        prop_assert_eq!(a % g, 0);
        prop_assert_eq!(b % g, 0);
    }

    #[test]
    fn reverse_reverse_is_identity(s in "[a-zA-Z0-9 ]{0,40}") {
        prop_assert_eq!(reverse(&reverse(&s)), s);
    }

    #[test]
    fn word_count_never_exceeds_length(s in "[a-z A-Z]{0,80}") {
        prop_assert!(word_count(&s) <= s.len() + 1);
    }
}
