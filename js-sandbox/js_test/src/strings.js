"use strict";

// String/async helpers and a couple of side-effecting functions.

function sayHi(name) {
  return `Hi, ${name}!`;
}

function slugify(text) {
  return text.toLowerCase().replace(/ /g, "-");
}

function greetLoud(name) {
  console.log(`Hello, ${name}!`); // side effect captured by spying on console
  return name.toUpperCase();
}

// Resolves after `ms` with the given value (used for async/timer demos).
function delay(value, ms = 10) {
  return new Promise((resolve) => setTimeout(() => resolve(value), ms));
}

// Rejects when name is empty (used for rejects/toThrow demos).
function fetchUser(id) {
  return new Promise((resolve, reject) => {
    if (!id) {
      reject(new Error("id is required"));
      return;
    }
    resolve({ id, name: `user-${id}` });
  });
}

// Old-style callback API (used for done() demos).
function loadConfig(callback) {
  setTimeout(() => callback(null, { mode: "production" }), 5);
}

module.exports = { sayHi, slugify, greetLoud, delay, fetchUser, loadConfig };
