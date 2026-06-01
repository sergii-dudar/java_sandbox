use test1::parser::{parse_config, ParseError};

#[test]
fn realistic_config() {
    let src = r#"
        # database
        db.host = localhost
        db.port = 5432

        # app
        app.name = playground
    "#;
    let m = parse_config(src).unwrap();
    assert_eq!(m.len(), 3);
    assert_eq!(m["db.host"], "localhost");
    assert_eq!(m["db.port"], "5432");
    assert_eq!(m["app.name"], "playground");
}

#[test]
fn reports_line_number_on_error() {
    let src = "ok = 1\nbad-line\n";
    assert_eq!(parse_config(src), Err(ParseError::MissingEquals(2)));
}

#[test]
fn values_may_contain_equals() {
    let m = parse_config("expr = 1 + 2 = 3").unwrap();
    assert_eq!(m["expr"], "1 + 2 = 3");
}
