//! Mock-based tests using the `mockall` crate.
//!
//! `#[automock]` derives a `MockMyTrait` type with expectation builders.
//! Test output remains standard libtest format.

use crate::services::*;
use mockall::{mock, predicate::*};

// -----------------------------------------------------------------------------
// `mock! { }` — explicit mock definition for traits we don't own / control.
// -----------------------------------------------------------------------------

mock! {
    pub Prices {}
    impl PriceProvider for Prices {
        fn price_of(&self, symbol: &str) -> Option<u64>;
    }
}

mock! {
    pub Notes {}
    impl Notifier for Notes {
        fn notify(&self, message: &str) -> Result<(), String>;
    }
}

#[test]
fn portfolio_sums_prices_and_notifies() {
    let mut prices = MockPrices::new();
    prices.expect_price_of()
        .with(eq("AAPL"))
        .times(1)
        .returning(|_| Some(180));
    prices.expect_price_of()
        .with(eq("MSFT"))
        .times(1)
        .returning(|_| Some(420));

    let mut notes = MockNotes::new();
    notes.expect_notify()
        .with(eq("total=600"))
        .times(1)
        .returning(|_| Ok(()));

    let portfolio = Portfolio { provider: &prices, notifier: &notes };
    assert_eq!(portfolio.total_value(&["AAPL", "MSFT"]).unwrap(), 600);
}

#[test]
fn missing_price_is_treated_as_zero() {
    let mut prices = MockPrices::new();
    prices.expect_price_of().returning(|_| None);

    let mut notes = MockNotes::new();
    notes.expect_notify()
        .with(eq("total=0"))
        .returning(|_| Ok(()));

    let portfolio = Portfolio { provider: &prices, notifier: &notes };
    assert_eq!(portfolio.total_value(&["FOO", "BAR"]).unwrap(), 0);
}

#[test]
fn notifier_error_propagates() {
    let mut prices = MockPrices::new();
    prices.expect_price_of().returning(|_| Some(1));

    let mut notes = MockNotes::new();
    notes.expect_notify()
        .returning(|_| Err("offline".into()));

    let portfolio = Portfolio { provider: &prices, notifier: &notes };
    assert_eq!(portfolio.total_value(&["X"]).unwrap_err(), "offline");
}

#[test]
#[should_panic] // mockall panics if an expectation was set but never matched.
fn unmet_expectation_panics_on_drop() {
    let mut prices = MockPrices::new();
    prices.expect_price_of()
        .with(eq("NEVER_CALLED"))
        .times(1)
        .returning(|_| Some(0));
    // dropping `prices` here panics because the expectation was never satisfied.
}
