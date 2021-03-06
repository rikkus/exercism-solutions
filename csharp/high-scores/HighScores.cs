using System.Collections.Generic;
using System.Linq;

public class HighScores
{
    private readonly List<int> scores;

    public HighScores(List<int> scores) => this.scores = scores;
    public List<int> Scores() => scores;
    public int Latest() => scores.Last();
    public int PersonalBest() => scores.Max();
    public List<int> PersonalTopThree() =>
        scores
        .OrderByDescending(n => n)
        .Take(3)
        .ToList();
}