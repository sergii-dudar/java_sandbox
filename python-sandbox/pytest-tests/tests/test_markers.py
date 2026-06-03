"""Variant: markers -- skip, skipif, xfail, and custom registered markers."""

import sys

import pytest

from calculator import add


@pytest.mark.skip(reason="demonstrates an unconditionally skipped test")
def test_always_skipped():
    assert False  # never executed


@pytest.mark.skipif(sys.version_info < (3, 8), reason="requires Python 3.8+")
def test_skipif_old_python():
    assert add(1, 1) == 2


@pytest.mark.xfail(reason="known bug: not implemented yet")
def test_expected_to_fail():
    assert add(1, 1) == 3  # fails -> reported as xfail, not a failure


@pytest.mark.xfail(reason="documents a bug that is actually fixed")
def test_unexpectedly_passing():
    # Passes despite xfail -> reported as XPASS.
    assert add(1, 1) == 2


def test_skip_imperatively():
    if not sys.platform.startswith("linux"):
        pytest.skip("only meaningful on Linux")
    assert add(2, 2) == 4


@pytest.mark.smoke
def test_custom_marker_smoke():
    # Run only these with: pytest -m smoke
    assert add(40, 2) == 42
