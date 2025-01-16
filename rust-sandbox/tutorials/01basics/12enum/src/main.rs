#[derive(Debug)]
enum GenderCategory {
    Male,
    Female,
}

// The `derive` attribute automatically creates the implementation
// required to make this `struct` printable with `fmt::Debug`.
#[derive(Debug)]
struct Person {
    name: String,
    gender: GenderCategory,
}

fn example1() {
    println!("--->>> : ");
    let p1 = Person {
        name: String::from("Mohtashim"),
        gender: GenderCategory::Male,
    };
    let p2 = Person {
        name: String::from("Amy"),
        gender: GenderCategory::Female,
    };
    println!("{:?}", p1);
    println!("{:?}", p2);
}
// -------------------------------------------Option Enum
fn is_even(no: i32) -> Option<bool> {
    if no % 2 == 0 {
        Some(true)
    } else {
        None
    }
}
fn example2() {
    println!("--->>> Option Enum: ");
    let result = is_even(3);
    println!("{:?}", result);
    println!("{:?}", is_even(30));
}
// =======================================================>>>Match with Option

enum CarType {
    Hatch,
    Sedan,
    SUV,
}
fn print_size(car: CarType) {
    match car {
        CarType::Hatch => {
            println!("Small sized car");
        }
        CarType::Sedan => {
            println!("medium sized car");
        }
        CarType::SUV => {
            println!("Large sized Sports Utility car");
        }
    }
}
fn example3() {
    println!("--->>> Match Statement and Enum: ");
    print_size(CarType::SUV);
    print_size(CarType::Hatch);
    print_size(CarType::Sedan);
}

// =======================================================>>>Match with Option

fn example4() {
    println!("--->>> Match with Option: ");
    match is_even(5) {
        Some(data) => {
            if data == true {
                println!("Even no");
            }
        }
        None => {
            println!("not even");
        }
    }
}
// =======================================================>>>Match & Enum with Data Type
#[derive(Debug)]
enum GenderCategory1 {
    Name(String),
    Usr_ID(i32),
}
fn example5() {
    println!("--->>> Match & Enum with Data Type: ");
    let p1 = GenderCategory1::Name(String::from("Mohtashim"));
    let p2 = GenderCategory1::Usr_ID(100);
    println!("{:?}", p1);
    println!("{:?}", p2);

    match p1 {
        GenderCategory1::Name(val) => {
            println!("{}", val);
        }
        GenderCategory1::Usr_ID(val) => {
            println!("{}", val);
        }
    }
}
// =======================================================>>>
fn example6() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example7() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example8() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example9() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example10() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example11() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example12() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example13() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example14() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example15() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example16() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example17() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example18() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example19() {
    println!("--->>> : ");
}
// =======================================================>>>
fn example20() {
    println!("--->>> : ");
}

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
