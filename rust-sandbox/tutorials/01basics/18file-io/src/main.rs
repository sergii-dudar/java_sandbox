use std::{
    fs::{self, OpenOptions},
    io::{Read, Write},
};

fn example1() {
    println!("--->>> Write to a File: ");
    let mut file = std::fs::File::create("data.txt").expect("create failed");
    file.write_all("Hello World".as_bytes())
        .expect("write failed");
    file.write_all("\nTutorialsPoint".as_bytes())
        .expect("write failed");
    println!("data written to file");

    println!("\n--->>> Append to a File: ");
    let mut file = OpenOptions::new()
        .append(true)
        .open("data.txt")
        .expect("cannot open file");
    file.write_all("\nHello World Appended".as_bytes())
        .expect("write failed");
    file.write_all("\nTutorialsPoint Appended".as_bytes())
        .expect("write failed");
    println!("file append success");

    println!("\n--->>> Read from a File: ");
    let mut file = std::fs::File::open("data.txt").unwrap();
    let mut contents = String::new();
    file.read_to_string(&mut contents).unwrap();
    println!("{}", contents);

    println!("\n--->>> Delete a file: ");
    fs::remove_file("data.txt").expect("could not remove file");
    println!("file is removed");
} // =======================================================>>>

fn example2() {
    /* println!("--->>> Copy a file: ");
    let mut command_line: std::env::Args = std::env::args();
    command_line.next().unwrap();
    // skip the executable file name
    // accept the source file
    let source = command_line.next().unwrap();
    // accept the destination file
    let destination = command_line.next().unwrap();
    let mut file_in = std::fs::File::open(source).unwrap();
    let mut file_out = std::fs::File::create(destination).unwrap();
    let mut buffer = [0u8; 4096];
    loop {
        let nbytes = file_in.read(&mut buffer).unwrap();
        file_out.write(&buffer[..nbytes]).unwrap();
        if nbytes < buffer.len() {
            break;
        }
    } */
} // =======================================================>>>
fn example3() {
    println!("--->>> : ");
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