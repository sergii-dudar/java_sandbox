//! Service traits used to demonstrate mock-based testing with `mockall`.

/// External price provider — a typical dependency we'd mock in tests.
pub trait PriceProvider {
    fn price_of(&self, symbol: &str) -> Option<u64>;
}

/// Notification sink — captures messages sent by the service under test.
pub trait Notifier {
    fn notify(&self, message: &str) -> Result<(), String>;
}

/// Domain service that depends on the two traits above.
pub struct Portfolio<'a, P: PriceProvider, N: Notifier> {
    pub provider: &'a P,
    pub notifier: &'a N,
}

impl<'a, P: PriceProvider, N: Notifier> Portfolio<'a, P, N> {
    /// Returns total value across the given symbols, notifying once at the end.
    pub fn total_value(&self, symbols: &[&str]) -> Result<u64, String> {
        let mut total: u64 = 0;
        for s in symbols {
            total = total.saturating_add(self.provider.price_of(s).unwrap_or(0));
        }
        self.notifier.notify(&format!("total={total}"))?;
        Ok(total)
    }
}
