using System;
using System.Collections.Generic;

public class Robot
{
    private static IEnumerator<string> _enumerator = GenerateNames();

    public string Name { get; private set; }

    public Robot() => Reset();

    public void Reset()
    {
        if (!_enumerator.MoveNext())
            throw new Exception("No more robot names available.");

        Name = _enumerator.Current;
    }

    private static IEnumerator<string> GenerateNames()
    {
        for (char c1 = 'A'; c1 <= 'Z'; c1++)
            for (char c2 = 'A'; c2 <= 'Z'; c2++)
                for (char c3 = '0'; c3 <= '9'; c3++)
                    for (char c4 = '0'; c4 <= '9'; c4++)
                        for (char c5 = '0'; c5 <= '9'; c5++)
                            yield return new String(new char[] { c1, c2, c3, c4, c5 });
    }
}