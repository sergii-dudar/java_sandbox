use crate::shapes::*;

fn approx(a: f64, b: f64) -> bool {
    (a - b).abs() < 1e-6
}

#[test]
fn circle_area() {
    let c = Circle { radius: 1.0 };
    assert!(approx(c.area(), std::f64::consts::PI));
}

#[test]
fn circle_perimeter() {
    let c = Circle { radius: 1.0 };
    assert!(approx(c.perimeter(), 2.0 * std::f64::consts::PI));
}

#[test]
fn rectangle_area_and_perimeter() {
    let r = Rectangle { width: 3.0, height: 4.0 };
    assert!(approx(r.area(), 12.0));
    assert!(approx(r.perimeter(), 14.0));
}

#[test]
fn triangle_345() {
    let t = Triangle { a: 3.0, b: 4.0, c: 5.0 };
    assert!(approx(t.area(), 6.0));
    assert!(approx(t.perimeter(), 12.0));
}
