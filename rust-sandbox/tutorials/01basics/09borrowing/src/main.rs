// https://www.tutorialspoint.com/rust/rust_borrowing.htm

fn print_vector(x: &Vec<i32>) {
    println!("Inside print_vector function {:?}", x);
}
fn example1() {
    println!("--->>> simple: ");
    let v = vec![10, 20, 30];
    print_vector(&v); // passing reference
    println!("Printing the value from main() v[0]={}", v[0]);
}
// -------------------
fn add_one(e: &mut i32) {
    *e += 1;
}
fn example2() {
    println!("--->>> Mutable References: ");
    let mut i = 3;
    add_one(&mut i);
    println!("{}", i);
}
// -------------------
fn display(param_name: &mut String) {
    println!("param_name value is :{}", param_name);
    param_name.push_str(" Rocks");
    //Modify the actual string,name
}
fn example3() {
    println!("--->>> Mutating a string reference: ");
    let mut name: String = String::from("TutorialsPoint");
    display(&mut name);
    //pass a mutable reference of name
    println!("The value of name after modification is:{}", name);
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
