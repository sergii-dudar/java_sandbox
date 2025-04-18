fn example1() {
    println!("--->>> basics: ");
    let tuple: (i32, f64, u8) = (-325, 4.9, 22);

    println!("{:?}", tuple);
    println!("integer is :{:?}", tuple.0);
    println!("float is :{:?}", tuple.1);
    println!("unsigned integer is :{:?}", tuple.2);
}

fn print_tuple(x: (i32, bool, f64)) {
    println!("Inside print method");
    println!("{:?}", x);
}
fn example2() {
    println!("--->>> tuple as a parameter: ");
    let b: (i32, bool, f64) = (110, true, 10.9);
    print_tuple(b);
}

fn print_tuple2(x: (i32, bool, f64)) {
    println!("Inside print method");
    let (age, is_male, cgpa) = x; //assigns a tuple to
    println!("Age is: {}, isMale?: {}, cgpa is: {}", age, is_male, cgpa);
}
fn example3() {
    println!("--->>> Tuple variable destructing: ");
    // Destructing assignment is a feature of rust wherein we unpack the values of a tuple.
    // This is achieved by assigning a tuple to distinct variables.
    let b: (i32, bool, f64) = (30, true, 7.9);
    print_tuple2(b);
}
fn example4() {
    println!("--->>> : ");
}
fn example5() {
    println!("--->>> : ");
}
fn example6() {
    println!("--->>> : ");
}
fn example7() {
    println!("--->>> : ");
}
fn example8() {
    println!("--->>> : ");
}
fn example9() {
    println!("--->>> : ");
}
fn example10() {
    println!("--->>> : ");
}
fn example11() {
    println!("--->>> : ");
}
fn example12() {
    println!("--->>> : ");
}
fn example13() {
    println!("--->>> : ");
}
fn example14() {
    println!("--->>> : ");
}
fn example15() {
    println!("--->>> : ");
}
fn example16() {
    println!("--->>> : ");
}
fn example17() {
    println!("--->>> : ");
}
fn example18() {
    println!("--->>> : ");
}
fn example19() {
    println!("--->>> : ");
}
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