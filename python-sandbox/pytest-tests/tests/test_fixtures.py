"""Variant: fixtures -- local, conftest-provided, yield/teardown, autouse, params."""

import pytest

from calculator import BankAccount


# A local fixture with setup + teardown via yield.
@pytest.fixture
def opened_account():
    account = BankAccount(balance=50.0)
    print("setup: account opened")
    yield account
    print("teardown: account closed")  # runs after the test


def test_uses_local_fixture(opened_account):
    opened_account.deposit(25)
    assert opened_account.balance == 75


def test_uses_conftest_fixture(account):
    # `account` comes from conftest.py
    assert account.balance == 100.0


def test_uses_session_fixture(session_marker):
    assert session_marker == "shared-across-the-session"


# Autouse fixture: runs for every test in this module without being requested.
_LOG: list[str] = []


@pytest.fixture(autouse=True)
def record_test_run():
    _LOG.append("ran")
    yield


def test_autouse_recorded_once():
    assert _LOG  # the autouse fixture populated it


# Parametrized fixture: every test using it runs once per param value.
@pytest.fixture(params=[0, 10, 100])
def starting_balance(request):
    return request.param


def test_balance_from_param_fixture(starting_balance):
    account = BankAccount(balance=starting_balance)
    assert account.balance == starting_balance


# Fixture composition: a fixture that depends on another fixture.
@pytest.fixture
def funded_account(account):
    account.deposit(900)
    return account


def test_fixture_composition(funded_account):
    assert funded_account.balance == 1000.0
