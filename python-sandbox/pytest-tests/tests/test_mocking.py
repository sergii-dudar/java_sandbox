"""Variant: mocking with unittest.mock (Mock, patch, MagicMock, side_effect)."""

from unittest.mock import MagicMock, Mock, call, patch

import strings


def test_mock_return_value():
    service = Mock()
    service.get_user.return_value = {"id": 1, "name": "Ada"}

    assert service.get_user(1) == {"id": 1, "name": "Ada"}
    service.get_user.assert_called_once_with(1)


def test_mock_side_effect():
    fake = Mock(side_effect=[10, 20, 30])
    assert [fake(), fake(), fake()] == [10, 20, 30]


def test_mock_raises():
    fake = Mock(side_effect=ValueError("boom"))
    try:
        fake()
    except ValueError as exc:
        assert str(exc) == "boom"
    else:  # pragma: no cover
        raise AssertionError("expected ValueError")


def test_patch_as_context_manager():
    with patch("strings.fetch_config", return_value="mocked") as mocked:
        assert strings.fetch_config() == "mocked"
        mocked.assert_called_once()


@patch("strings.fetch_config")
def test_patch_as_decorator(mock_fetch):
    mock_fetch.return_value = "decorated"
    assert strings.fetch_config() == "decorated"


def test_magicmock_call_tracking():
    db = MagicMock()
    db.insert("a")
    db.insert("b")

    assert db.insert.call_count == 2
    db.insert.assert_has_calls([call("a"), call("b")])
