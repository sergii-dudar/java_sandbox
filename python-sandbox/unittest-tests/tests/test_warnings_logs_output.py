"""Variant: capturing warnings, logs and output; plus temp dirs.

These use the unittest equivalents of pytest's built-in fixtures.
"""

import logging
import os
import tempfile
import unittest
from contextlib import redirect_stdout
from io import StringIO

from strings import do_work, fetch_config, greet_loud, legacy_double


class TestWarningsAndLogs(unittest.TestCase):
    def test_assert_warns(self):
        with self.assertWarns(DeprecationWarning):
            self.assertEqual(legacy_double(21), 42)

    def test_assert_warns_regex(self):
        with self.assertWarnsRegex(DeprecationWarning, "deprecated"):
            legacy_double(1)

    def test_assert_logs(self):
        with self.assertLogs("demo", level="WARNING") as cm:
            do_work()
        self.assertIn("something happened", cm.output[0])

    def test_capture_stdout(self):
        buffer = StringIO()
        with redirect_stdout(buffer):
            result = greet_loud("Alice")
        self.assertEqual(buffer.getvalue(), "Hello, Alice!\n")
        self.assertEqual(result, "ALICE")


class TestTempDirAndEnv(unittest.TestCase):
    def setUp(self):
        # TemporaryDirectory cleaned up automatically via addCleanup.
        self._tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self._tmp.cleanup)
        self.tmp_path = self._tmp.name

    def test_tmp_dir_write_read(self):
        path = os.path.join(self.tmp_path, "data.txt")
        with open(path, "w") as fh:
            fh.write("hello")
        with open(path) as fh:
            self.assertEqual(fh.read(), "hello")

    def test_env_override(self):
        original = os.environ.get("APP_MODE")
        os.environ["APP_MODE"] = "testing"
        self.addCleanup(_restore_env, "APP_MODE", original)
        self.assertEqual(fetch_config(), "testing")


def _restore_env(key, value):
    if value is None:
        os.environ.pop(key, None)
    else:
        os.environ[key] = value


if __name__ == "__main__":
    unittest.main()
