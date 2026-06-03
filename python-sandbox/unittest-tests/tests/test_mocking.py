"""Variant: mocking with unittest.mock (Mock, patch, MagicMock, side_effect)."""

import unittest
from unittest.mock import MagicMock, Mock, call, patch

import strings


class TestMocking(unittest.TestCase):
    def test_mock_return_value(self):
        service = Mock()
        service.get_user.return_value = {"id": 1, "name": "Ada"}

        self.assertEqual(service.get_user(1), {"id": 1, "name": "Ada"})
        service.get_user.assert_called_once_with(1)

    def test_mock_side_effect_iterable(self):
        fake = Mock(side_effect=[10, 20, 30])
        self.assertEqual([fake(), fake(), fake()], [10, 20, 30])

    def test_mock_side_effect_exception(self):
        fake = Mock(side_effect=ValueError("boom"))
        with self.assertRaises(ValueError):
            fake()

    def test_patch_context_manager(self):
        with patch("strings.fetch_config", return_value="mocked") as mocked:
            self.assertEqual(strings.fetch_config(), "mocked")
            mocked.assert_called_once()

    @patch("strings.fetch_config")
    def test_patch_decorator(self, mock_fetch):
        mock_fetch.return_value = "decorated"
        self.assertEqual(strings.fetch_config(), "decorated")

    @patch.dict("os.environ", {"APP_MODE": "testing"})
    def test_patch_dict_env(self):
        self.assertEqual(strings.fetch_config(), "testing")

    def test_magicmock_call_tracking(self):
        db = MagicMock()
        db.insert("a")
        db.insert("b")

        self.assertEqual(db.insert.call_count, 2)
        db.insert.assert_has_calls([call("a"), call("b")])


if __name__ == "__main__":
    unittest.main()
