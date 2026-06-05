"use strict";

// A module whose dependency we will mock in mocking.test.js.
const { fetchUser } = require("./strings");

async function getUserName(id) {
  const user = await fetchUser(id);
  return user.name;
}

module.exports = { getUserName };
