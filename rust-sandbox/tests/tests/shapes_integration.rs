mod common;

use common::approx_eq;
use test1::shapes::{Circle, Rectangle, Shape, Triangle};

fn total_area(shapes: &[Box<dyn Shape>]) -> f64 {
    shapes.iter().map(|s| s.area()).sum()
}

#[test]
fn polymorphic_total_area() {
    let shapes: Vec<Box<dyn Shape>> = vec![
        Box::new(Circle { radius: 1.0 }),
        Box::new(Rectangle { width: 2.0, height: 3.0 }),
        Box::new(Triangle { a: 3.0, b: 4.0, c: 5.0 }),
    ];
    let expected = std::f64::consts::PI + 6.0 + 6.0;
    assert!(approx_eq(total_area(&shapes), expected));
}

#[test]
fn rectangle_is_square_when_equal_sides() {
    let r = Rectangle { width: 4.0, height: 4.0 };
    assert!(approx_eq(r.area(), 16.0));
    assert!(approx_eq(r.perimeter(), 16.0));
}
