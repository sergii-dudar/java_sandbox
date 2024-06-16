import platform


def is_macos():
    return platform.system() == "Darwin"


def is_linux():
    return platform.system() == "Linux"


print(f"Is Linux: {is_linux()}")
print(f"Is Mac Os: {is_macos()}")
