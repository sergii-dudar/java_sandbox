// #[derive(Debug, Copy, Clone)]
struct Employee {
    name: String,
    company: String,
    age: u32,
}

fn example1() {
    println!("--->>> Simple: ");
    let emp1 = Employee {
        company: String::from("TutorialsPoint"),
        name: String::from("Mohtashim"),
        age: 50,
    };
    println!(
        "Name is: {} company is: {} age is: {}",
        emp1.name, emp1.company, emp1.age
    );
}
//-------------------------------------------
fn example2() {
    println!("--->>> Modifying a struct instance: ");
    let mut emp1 = Employee {
        company: String::from("TutorialsPoint"),
        name: String::from("Mohtashim"),
        age: 50,
    };
    emp1.age = 40;
    println!(
        "Name is: {} company is: {} age is: {}",
        emp1.name, emp1.company, emp1.age
    );
}
// -----------------------------------------
fn display_struct(emp: Employee) {
    println!(
        "Name is: {} company is: {} age is: {}",
        emp.name, emp.company, emp.age
    );
}
fn edit_struct(emp: &mut Employee) {
    emp.age += 12
}
fn example3() {
    println!("--->>> Passing a struct to a function: ");
    //initialize a structure
    let emp1 = Employee {
        company: String::from("TutorialsPoint"),
        name: String::from("Mohtashim"),
        age: 50,
    };
    let mut emp2 = Employee {
        company: String::from("TutorialsPoint"),
        name: String::from("Kannan"),
        age: 32,
    };
    //pass emp1 and emp2 to display()
    display_struct(emp1);
    // display_struct(emp2);
    edit_struct(&mut emp2);
    display_struct(emp2);
}
//-------------------------------------------
fn who_is_elder(emp1: Employee, emp2: Employee) -> Employee {
    if emp1.age > emp2.age {
        return emp1;
    }
    // } else {
    //     return emp2;
    // }
    emp2
}
fn display(emp: Employee) {
    println!(
        "Name is :{} company is {} age is {}",
        emp.name, emp.company, emp.age
    );
}
fn example4() {
    println!("--->>> Returning struct from a function: ");
    let emp1 = Employee {
        company: String::from("TutorialsPoint"),
        name: String::from("Mohtashim"),
        age: 50,
    };
    let emp2 = Employee {
        company: String::from("TutorialsPoint"),
        name: String::from("Kannan"),
        age: 32,
    };
    let elder = who_is_elder(emp1, emp2);
    println!("elder is:");

    //prints details of the elder employee
    display(elder);
}
//-------------------------------------------

//define dimensions of a rectangle
struct Rectangle {
    width: u32,
    height: u32,
}

trait NewTrait {
    fn area(&self) -> u32;
}

//logic to calculate area of a rectangle
impl NewTrait for Rectangle {
    fn area(&self) -> u32 {
        //use the . operator to fetch the value of a field via the self keyword
        self.width * self.height
    }
}

fn example5() {
    println!("--->>> : Method in Structure");
    let small = Rectangle {
        width: 10,
        height: 20,
    };
    //print the rectangle's area
    println!(
        "width is: {} height is: {} area of Rectangle is: {}",
        small.width,
        small.height,
        small.area()
    );
}
//-------------------------------------------

//declare a structure
struct Point {
    x: i32,
    y: i32,
}
impl Point {
    //static method that creates objects of the Point structure
    fn getInstance(x: i32, y: i32) -> Point {
        Point { x: x, y: y }
    }
    //display values of the structure's field
    fn display(&self) {
        println!("x = {} y = {}", self.x, self.y);
    }
}
fn example6() {
    println!("--->>> Declaring a static method: ");
    let p1 = Point::getInstance(10, 20);
    p1.display();
}
//-------------------------------------------
fn example7() {
    println!("--->>> : ");
}
//-------------------------------------------
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
