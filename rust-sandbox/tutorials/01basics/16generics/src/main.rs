use std::fmt::Display;

fn example1() {
    println!("--->>> Generic Collection: ");
    let mut vector_integer: Vec<i32> = vec![20, 30];
    vector_integer.push(40);
    // vector_integer.push("hello"); missmatched type
    println!("{:?}", vector_integer);
} // =======================================================>>>

struct Data<T> {
    value: T,
}
fn example2() {
    println!("--->>> Generic Structure: ");

    //generic type of i32
    let t: Data<i32> = Data { value: 350 };
    println!("value is :{} ", t.value);

    //generic type of String
    let t2: Data<String> = Data {
        value: "Tom".to_string(),
    };
    println!("value is :{} ", t2.value);
} // =======================================================>>>

//declare a structure
struct Book {
    name: &'static str,
    id: u32,
}
//declare a trait
trait Printable {
    fn print(&self);
}
//implement the trait
impl Printable for Book {
    fn print(&self) {
        println!(
            "Printing book with id: {}, and name: {}",
            self.id, self.name
        )
    }
}

fn example3() {
    println!("--->>> Traits: ");
    //create an instance of the structure
    let b1 = Book {
        id: 1001,
        name: "Rust in Action",
    };
    b1.print();
} // =======================================================>>>
fn example4() {
    println!("--->>> Generic Functions: ");
} // =======================================================>>>

fn print_pro<T: Display>(t: T) {
    // The parameter’s type should implement the Display trait so that its value can
    // be printed by the println! macro.
    println!("Inside print_pro generic function:");
    println!("{}", t);
}

fn example5() {
    print_pro(10 as u8);
    print_pro(20 as u16);
    print_pro("Hello TutorialsPoint");
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
