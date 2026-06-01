//! Tiny collection helpers (generic).

pub fn sum_i64(items: &[i64]) -> i64 {
    items.iter().sum()
}

pub fn average(items: &[f64]) -> Option<f64> {
    if items.is_empty() {
        None
    } else {
        Some(items.iter().sum::<f64>() / items.len() as f64)
    }
}

pub fn max_i64(items: &[i64]) -> Option<i64> {
    items.iter().copied().max()
}

pub fn min_i64(items: &[i64]) -> Option<i64> {
    items.iter().copied().min()
}

pub fn dedup_sorted<T: Eq + Clone>(items: &[T]) -> Vec<T> {
    let mut out: Vec<T> = Vec::with_capacity(items.len());
    for x in items {
        if out.last() != Some(x) {
            out.push(x.clone());
        }
    }
    out
}

