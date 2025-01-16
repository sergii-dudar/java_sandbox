/*
    //Syntax1
    let variable_name = [value1,value2,value3];

    //Syntax2
    let variable_name:[dataType;size] = [value1,value2,value3];

    //Syntax3
    let variable_name:[dataType;size] = [default_value_for_elements,size];
*/

fn example1() {
    println!("--->>> Basics: ");
    let arr: [i32; 4] = [10, 20, 30, 40];
    println!("array is {:?}", arr);
    println!("array size is :{}", arr.len());

    // Array without data type
    let arr = [10, 20, 30, 40];
    println!("\narray is {:?}", arr);
    println!("array size is :{}", arr.len());

    // Default values
    let arr: [i32; 4] = [-1; 4];
    println!("\narray is {:?}", arr);
    println!("array size is :{}", arr.len());

    // Array with for loop
    let arr: [i32; 4] = [10, 20, 30, 40];
    println!("\narray is {:?}", arr);
    println!("array size is :{} - ", arr.len());

    for index in 0..4 {
        println!("{} & value is : {}", index, arr[index]);
    }
}
fn example2() {
    println!("--->>> Using the iter() function: ");
    let arr: [i32; 4] = [10, 20, 30, 40];
    println!("array is {:?}", arr);
    print!("array size is :{} - ", arr.len());

    for val in arr.iter() {
        print!("{}, ", val);
    }
}
fn example3() {
    println!("--->>> Mutable array: ");
    let mut arr: [i32; 4] = [10, 20, 30, 40];
    arr[1] = 0;
    println!("{:?}", arr);
}
// --------------------------
fn update_by_val(mut arr: [i32; 3]) {
    for i in 0..3 {
        let var_name = arr[i];
        arr[i] = var_name * 2;
    }
    println!("Inside update {:?}", arr);
}
fn example4() {
    println!("--->>> Passing Arrays as value: ");
    let arr = [10, 20, 30];
    update_by_val(arr);

    print!("Inside main {:?}", arr);
}
// --------------------------
fn update_by_ref(arr: &mut [i32; 3]) {
    for i in 0..3 {
        let var_name = arr[i];
        arr[i] = var_name * 2;
    }
    println!("Inside update {:?}", arr);
}
fn example5() {
    println!("--->>> Passing Arrays by reference: ");
    let mut arr = [10, 20, 30];
    update_by_ref(&mut arr);
    print!("Inside main {:?}", arr);
}
// --------------------------
fn example6() {
    println!("--->>> Array Declaration and Constants: ");
    // let N: usize = 20; // error
    const N: usize = 20;
    let arr = [0; N]; //Error: non-constant used with constant
    print!("{}", arr[10])
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
