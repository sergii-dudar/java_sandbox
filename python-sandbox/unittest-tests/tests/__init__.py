"""Make the sibling ``src/`` directory importable for all test modules.

unittest imports this package (because ``__init__.py`` exists) before loading
the individual ``test_*.py`` modules, so adding ``src/`` to ``sys.path`` here is
enough for ``import calculator`` / ``import strings`` to work everywhere.
"""

import os
import sys

_SRC = os.path.join(os.path.dirname(os.path.dirname(__file__)), "src")
if _SRC not in sys.path:
    sys.path.insert(0, _SRC)
