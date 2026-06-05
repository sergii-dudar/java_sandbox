// A module whose dependency we will mock in mocking.test.ts.
import { fetchUser } from "./strings";

export async function getUserName(id: number): Promise<string> {
  const user = await fetchUser(id);
  return user.name;
}
