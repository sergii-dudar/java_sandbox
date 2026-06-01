use test1::collections::*;

#[test]
fn sum_and_average_consistent() {
    let v = [1.0, 2.0, 3.0, 4.0];
    let sum: f64 = v.iter().sum();
    assert!((sum / v.len() as f64 - average(&v).unwrap()).abs() < 1e-9);
}

#[test]
fn min_max_on_single_element() {
    assert_eq!(min_i64(&[42]), Some(42));
    assert_eq!(max_i64(&[42]), Some(42));
}

#[test]
fn dedup_keeps_order() {
    let xs = vec!["a", "a", "b", "c", "c", "a"];
    assert_eq!(dedup_sorted(&xs), vec!["a", "b", "c", "a"]);
}

#[test]
fn empty_min_max_are_none() {
    let v: [i64; 0] = [];
    assert!(min_i64(&v).is_none());
    assert!(max_i64(&v).is_none());
}
