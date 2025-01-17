trait Perimeter {
    fn a(&self) -> f64;
}
struct Square {
    side: f64,
}
impl Perimeter for Square {
    fn a(&self) -> f64 {
        4.0 * self.side
    }
}
struct Rectangle {
    length: f64,
    breadth: f64,
}
impl Perimeter for Rectangle {
    fn a(&self) -> f64 {
        2.0 * (self.length + self.breadth)
    }
}
fn print_perimeter<T1, T2>(s: T1, r: T2)
where
    T1: Perimeter,
    T2: Perimeter,
{
    let r1 = s.a();
    let r2 = r.a();
    println!("Perimeter of a square is {}", r1);
    println!("Perimeter of a rectangle is {}", r2);
}

fn example1() {
    println!("--->>> Multiple trait bounds: ");

    let sq = Square { side: 6.2 };
    let rect = Rectangle {
        length: 3.2,
        breadth: 5.6,
    };
    print_perimeter(sq, rect);
}
// =======================================================>>>
// =======================================================>>>
// =======================================================>>>

trait Sample {
    fn a(&self);
    fn b(&self) {
        println!("Print b");
    }
}

struct Example {
    a: i32,
    b: i32,
}

impl Sample for Example {
    fn a(&self) {
        println!("Value of a is {}", self.a);
    }

    fn b(&self) {
        println!("Value of b is {}", self.b);
    }
}
fn example2() {
    println!("--->>> Default methods: ");
    let r = Example { a: 5, b: 7 };
    r.a();
    r.b();
}
// =======================================================>>>
// =======================================================>>>
// =======================================================>>>

trait A {
    fn f(&self);
}
trait B: A {
    fn t(&self);
}
struct ExampleIn {
    first: String,
    second: String,
}
impl A for ExampleIn {
    fn f(&self) {
        print!("{} ", self.first);
    }
}
impl B for ExampleIn {
    fn t(&self) {
        print!("{}", self.second);
    }
}

fn example3() {
    println!("--->>> Inheritance: ");

    let s = ExampleIn {
        first: String::from("javaTpoint"),
        second: String::from("tutorial"),
    };
    s.f();
    s.t();
} // =======================================================>>>

fn example4() {
    println!("--->>> : ");
} // =======================================================>>>
fn example5() {
    println!("--->>> : ");
} // =======================================================>>>
fn example6() {
    println!("--->>> : ");
} // =======================================================>>>
fn example7() {
    println!("--->>> : ");
} // =======================================================>>>
fn example8() {
    println!("--->>> : ");
} // =======================================================>>>
fn example9() {
    println!("--->>> : ");
} // =======================================================>>>
fn example10() {
    println!("--->>> : ");
} // =======================================================>>>
fn example11() {
    println!("--->>> : ");
} // =======================================================>>>
fn example12() {
    println!("--->>> : ");
} // =======================================================>>>
fn example13() {
    println!("--->>> : ");
} // =======================================================>>>
fn example14() {
    println!("--->>> : ");
} // =======================================================>>>
fn example15() {
    println!("--->>> : ");
} // =======================================================>>>
fn example16() {
    println!("--->>> : ");
} // =======================================================>>>
fn example17() {
    println!("--->>> : ");
} // =======================================================>>>
fn example18() {
    println!("--->>> : ");
} // =======================================================>>>
fn example19() {
    println!("--->>> : ");
} // =======================================================>>>
fn example20() {
    println!("--->>> : ");
} // =======================================================>>>

fn main() {
    println!(">>>>>--------------EXAMPLE1--------------<<<<<");
    example1();
    println!("\n\n>>>>>--------------EXAMPLE2--------------<<<<<");
    example2();
    println!("\n\n>>>>>--------------EXAMPLE3--------------<<<<<");
    example3();
    println!("\n\n>>>>>--------------EXAMPLE4--------------<<<<<");
    example4();
    println!("\n\n>>>>>--------------EXAMPLE5--------------<<<<<");
    example5();
    println!("\n\n>>>>>--------------EXAMPLE6--------------<<<<<");
    example6();
    println!("\n\n>>>>>--------------EXAMPLE7--------------<<<<<");
    example7();
    println!("\n\n>>>>>--------------EXAMPLE8--------------<<<<<");
    example8();
    println!("\n\n>>>>>--------------EXAMPLE9--------------<<<<<");
    example9();
    println!("\n\n>>>>>--------------EXAMPLE10--------------<<<<<");
    example10();
    println!("\n\n>>>>>--------------EXAMPLE11--------------<<<<<");
    example11();
    println!("\n\n>>>>>--------------EXAMPLE12--------------<<<<<");
    example12();
    println!("\n\n>>>>>--------------EXAMPLE13--------------<<<<<");
    example13();
    println!("\n\n>>>>>--------------EXAMPLE14--------------<<<<<");
    example14();
    println!("\n\n>>>>>--------------EXAMPLE15--------------<<<<<");
    example15();
    println!("\n\n>>>>>--------------EXAMPLE16--------------<<<<<");
    example16();
    println!("\n\n>>>>>--------------EXAMPLE17--------------<<<<<");
    example17();
    println!("\n\n>>>>>--------------EXAMPLE18--------------<<<<<");
    example18();
    println!("\n\n>>>>>--------------EXAMPLE19--------------<<<<<");
    example19();
    println!("\n\n>>>>>--------------EXAMPLE20--------------<<<<<");
    example20();
}