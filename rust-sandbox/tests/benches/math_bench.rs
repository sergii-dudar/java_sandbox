//! Criterion benchmarks for `test1::math`.
//!
//! Run with `cargo bench` or `make bench`. Output goes to
//! `target/criterion/` (JSON + optional HTML when enabled).

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};
use test1::math::*;

fn bench_fibonacci(c: &mut Criterion) {
    let mut group = c.benchmark_group("fibonacci");
    for n in [5u32, 10, 20, 30].iter() {
        group.bench_with_input(BenchmarkId::from_parameter(n), n, |b, &n| {
            b.iter(|| fibonacci(black_box(n)));
        });
    }
    group.finish();
}

fn bench_factorial(c: &mut Criterion) {
    c.bench_function("factorial 20", |b| b.iter(|| factorial(black_box(20))));
}

fn bench_is_prime(c: &mut Criterion) {
    let mut group = c.benchmark_group("is_prime");
    group.throughput(Throughput::Elements(1));
    for n in [97u64, 7919, 1_000_003].iter() {
        group.bench_with_input(BenchmarkId::from_parameter(n), n, |b, &n| {
            b.iter(|| is_prime(black_box(n)));
        });
    }
    group.finish();
}

fn bench_gcd(c: &mut Criterion) {
    c.bench_function("gcd 1234x5678", |b| {
        b.iter(|| gcd(black_box(1234), black_box(5678)));
    });
}

criterion_group!(benches, bench_fibonacci, bench_factorial, bench_is_prime, bench_gcd);
criterion_main!(benches);
