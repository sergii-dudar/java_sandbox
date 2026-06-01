//! Snapshot (golden) tests using the `insta` crate.
//!
//! `insta` produces a distinct test output: on first run or when a value
//! changes, it writes a `.snap.new` file and the test fails until the
//! snapshot is approved with `cargo insta review` / `cargo insta accept`.
//!
//! To keep this self-contained we mostly use **inline** snapshots
//! (`@"..."`) so no external files are required for the suite to pass.

use crate::parser::parse_config;

#[test]
fn snapshot_inline_string() {
    insta::assert_snapshot!("hello, world", @"hello, world");
}

#[test]
fn snapshot_inline_debug() {
    let data = vec![1, 2, 3, 4];
    insta::assert_debug_snapshot!(data, @r###"
    [
        1,
        2,
        3,
        4,
    ]
    "###);
}

#[test]
fn snapshot_inline_yaml() {
    let cfg = parse_config("name = ada\nrole = admin\n").unwrap();
    let mut pairs: Vec<(String, String)> = cfg.into_iter().collect();
    pairs.sort();
    insta::assert_yaml_snapshot!(pairs, @r###"
    - - name
      - ada
    - - role
      - admin
    "###);
}

#[test]
fn snapshot_inline_json() {
    let data = serde_json_value();
    insta::assert_json_snapshot!(data, @r###"
    {
      "ok": true,
      "count": 3
    }
    "###);
}

// `insta` re-exports a tiny json value builder so we don't need serde_json.
fn serde_json_value() -> insta::internals::Content {
    use insta::internals::Content;
    Content::Struct("Result", vec![
        ("ok", Content::Bool(true)),
        ("count", Content::U64(3)),
    ])
}
