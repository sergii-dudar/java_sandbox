// String/async helpers and side-effecting functions (typed).

export interface User {
  id: number;
  name: string;
}

export function sayHi(name: string): string {
  return `Hi, ${name}!`;
}

export function slugify(text: string): string {
  return text.toLowerCase().replace(/ /g, "-");
}

export function greetLoud(name: string): string {
  console.log(`Hello, ${name}!`); // side effect captured by spying on console
  return name.toUpperCase();
}

export function delay<T>(value: T, ms = 10): Promise<T> {
  return new Promise((resolve) => setTimeout(() => resolve(value), ms));
}

export function fetchUser(id: number): Promise<User> {
  return new Promise((resolve, reject) => {
    if (!id) {
      reject(new Error("id is required"));
      return;
    }
    resolve({ id, name: `user-${id}` });
  });
}

export function loadConfig(
  callback: (err: Error | null, config: { mode: string }) => void,
): void {
  setTimeout(() => callback(null, { mode: "production" }), 5);
}
