use crate::collections::*;

#[test]
fn sum_basic() {
    assert_eq!(sum_i64(&[1, 2, 3, 4]), 10);
}

#[test]
fn sum_empty() {
    assert_eq!(sum_i64(&[]), 0);
}

#[test]
fn average_some() {
    assert_eq!(average(&[2.0, 4.0, 6.0]), Some(4.0));
}

#[test]
fn average_none_on_empty() {
    assert_eq!(average(&[]), None);
}

#[test]
fn max_and_min() {
    let v = [3, 1, 4, 1, 5, 9, 2, 6];
    assert_eq!(max_i64(&v), Some(9));
    assert_eq!(min_i64(&v), Some(1));
}

#[test]
fn dedup_keeps_one_of_each_consecutive() {
    assert_eq!(dedup_sorted(&[1, 1, 2, 3, 3, 3, 4]), vec![1, 2, 3, 4]);
}
