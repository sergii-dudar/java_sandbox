//! Tiny `key=value` configuration parser.

use std::collections::HashMap;

#[derive(Debug, PartialEq, Eq)]
pub enum ParseError {
    MissingEquals(usize),
    EmptyKey(usize),
}

/// Parses lines of `key = value`, skipping blank lines and `#` comments.
pub fn parse_config(input: &str) -> Result<HashMap<String, String>, ParseError> {
    let mut out = HashMap::new();
    for (i, raw) in input.lines().enumerate() {
        let line = raw.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let (k, v) = line.split_once('=').ok_or(ParseError::MissingEquals(i + 1))?;
        let k = k.trim().to_string();
        let v = v.trim().to_string();
        if k.is_empty() {
            return Err(ParseError::EmptyKey(i + 1));
        }
        out.insert(k, v);
    }
    Ok(out)
}

