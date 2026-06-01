//! Criterion benchmarks for `test1::strings`.

use criterion::{black_box, criterion_group, criterion_main, Criterion};
use test1::strings::*;

fn bench_reverse(c: &mut Criterion) {
    let input: String = "the quick brown fox jumps over the lazy dog".repeat(10);
    c.bench_function("reverse long string", |b| {
        b.iter(|| reverse(black_box(&input)));
    });
}

fn bench_palindrome(c: &mut Criterion) {
    let input = "A man a plan a canal Panama".repeat(4);
    c.bench_function("is_palindrome long", |b| {
        b.iter(|| is_palindrome(black_box(&input)));
    });
}

fn bench_word_count(c: &mut Criterion) {
    let input: String = "lorem ipsum dolor sit amet ".repeat(50);
    c.bench_function("word_count", |b| {
        b.iter(|| word_count(black_box(&input)));
    });
}

criterion_group!(benches, bench_reverse, bench_palindrome, bench_word_count);
criterion_main!(benches);
