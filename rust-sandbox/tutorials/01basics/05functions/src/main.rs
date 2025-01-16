fn get_pi() -> f64 {
    22.0 / 7.0
}
fn mutate_no_to_zero(mut param_no: i32) {
    param_no = param_no * 2;
    println!("param_no value is :{}", param_no);
}
fn mutate_no_to_zero_ref(param_no: &mut i32) {
    *param_no = 0; //de reference
}
fn example1() {
    println!("--->>> basics: ");
    println!("pi value is {}", get_pi());

    // pass by value
    let no: i32 = 5;
    mutate_no_to_zero(no);
    println!("The value of no is:{}", no);

    // Pass by Reference
    let mut no1: i32 = 5;
    mutate_no_to_zero_ref(&mut no1);
    println!("The value of no is:{}", no1);
}

fn display(param_name: String) {
    println!("param_name value is :{}", param_name);
}
fn example2() {
    println!("--->>> Passing string to a function: ");
    let name: String = String::from("TutorialsPoint");
    display(name);
    // println!("param_name value is :{}", name);
}
fn example3() {
    println!("--->>> : ");
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
