use crate::parser::*;

#[test]
fn parses_simple_pairs() {
    let m = parse_config("a=1\nb=2").unwrap();
    assert_eq!(m.get("a").map(String::as_str), Some("1"));
    assert_eq!(m.get("b").map(String::as_str), Some("2"));
}

#[test]
fn ignores_comments_and_blanks() {
    let src = "
        # a comment
        host = localhost
        port = 8080
    ";
    let m = parse_config(src).unwrap();
    assert_eq!(m.len(), 2);
    assert_eq!(m["host"], "localhost");
    assert_eq!(m["port"], "8080");
}

#[test]
fn missing_equals_errors() {
    let err = parse_config("oops").unwrap_err();
    assert_eq!(err, ParseError::MissingEquals(1));
}

#[test]
fn empty_key_errors() {
    let err = parse_config(" = 5").unwrap_err();
    assert_eq!(err, ParseError::EmptyKey(1));
}
