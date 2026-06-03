"""Variant: built-in fixtures -- tmp_path, monkeypatch, capsys, caplog, recwarn."""

import logging

import pytest

from strings import fetch_config, greet_loud, legacy_double


def test_tmp_path(tmp_path):
    # tmp_path is a unique pathlib.Path per test, auto-cleaned up.
    data_file = tmp_path / "data.txt"
    data_file.write_text("hello")
    assert data_file.read_text() == "hello"
    assert data_file.exists()


def test_monkeypatch_env(monkeypatch):
    monkeypatch.setenv("APP_MODE", "testing")
    assert fetch_config() == "testing"


def test_monkeypatch_attr(monkeypatch):
    # Replace a function/attribute for the duration of the test.
    monkeypatch.setattr("strings.fetch_config", lambda: "patched")
    import strings

    assert strings.fetch_config() == "patched"


def test_capsys(capsys):
    result = greet_loud("Alice")
    captured = capsys.readouterr()
    assert captured.out == "Hello, Alice!\n"
    assert result == "ALICE"


def test_caplog(caplog):
    with caplog.at_level(logging.WARNING):
        logging.getLogger("demo").warning("something happened")
    assert "something happened" in caplog.text


def test_recwarn_and_warns():
    # pytest.warns asserts a warning is raised.
    with pytest.warns(DeprecationWarning, match="deprecated"):
        assert legacy_double(21) == 42
