use test1::strings::*;

#[test]
fn reverse_then_reverse_is_identity() {
    let s = "Rust is fun";
    assert_eq!(reverse(&reverse(s)), s);
}

#[test]
fn palindrome_phrases() {
    assert!(is_palindrome("Was it a car or a cat I saw?"));
    assert!(is_palindrome("No 'x' in Nixon"));
    assert!(!is_palindrome("definitely not"));
}

#[test]
fn capitalize_and_shout() {
    assert_eq!(shout(&capitalize("hello world")), "HELLO WORLD");
}
