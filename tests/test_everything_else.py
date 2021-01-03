"""Kitchen sink/garbage dump of everything else I could think of testing.

There are some things that are just easier in Python
than they are in Bash syntax,
so I've decided to use Python to run the tests.
"""

import os
from pathlib import Path


def path_exists(s: str):
    PATH_ENV = os.getenv("PATH").split(":")
    for p in PATH_ENV:
        if s == p:
            return True
    return False


def test_path_environment_variable():
    homedir = Path.home()
    expected_paths = list(
        str(p)
        for p in (
            homedir / "anaconda/bin",
            homedir / "anaconda/condabin",
            homedir / ".linuxbrew/bin",
            homedir / ".linuxbrew/sbin",
            homedir / "bin",
        )
    )
    expected_paths

    for p in expected_paths:
        assert path_exists(p), f"{p} not present in PATH environment variable"
    print("Horray! All expected paths exist in PATH! :)")


if __name__ == "__main__":
    test_path_environment_variable()
