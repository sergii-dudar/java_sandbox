"""String helpers and a couple of functions with side effects / warnings."""

from __future__ import annotations

import logging
import os
import warnings

logger = logging.getLogger("demo")


def say_hi(name: str) -> str:
    return f"Hi, {name}!"


def slugify(text: str) -> str:
    return text.lower().replace(" ", "-")


def greet_loud(name: str) -> str:
    print(f"Hello, {name}!")  # side effect
    return name.upper()


def fetch_config() -> str:
    """Reads an env var indirectly so it can be patched."""
    return os.environ.get("APP_MODE", "production")


def legacy_double(n: int) -> int:
    warnings.warn("legacy_double is deprecated, use n * 2", DeprecationWarning)
    return n * 2


def do_work() -> None:
    logger.warning("something happened")
