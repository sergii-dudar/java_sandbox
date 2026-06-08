namespace Sandbox;

/// <summary>String helpers used by the example tests.</summary>
public static class Strings
{
    public static string SayHi(string name) => $"Hi, {name}!";

    public static string Slugify(string text) => text.ToLowerInvariant().Replace(' ', '-');

    public static string Reverse(string text)
    {
        var chars = text.ToCharArray();
        Array.Reverse(chars);
        return new string(chars);
    }

    public static bool IsPalindrome(string text) => text == Reverse(text);

    public static IReadOnlyList<string> Words(string sentence) =>
        string.IsNullOrWhiteSpace(sentence)
            ? Array.Empty<string>()
            : sentence.Trim().Split((char[]?)null, StringSplitOptions.RemoveEmptyEntries);
}
