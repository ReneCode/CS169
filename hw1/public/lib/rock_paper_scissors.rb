class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    s1 = player1[1]
    s2 = player2[1]
    # check if there are valid strategies
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" unless s1.match(/[RPS]/i)
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" unless s2.match(/[RPS]/i)
    # both players with same strategy
    return player1 if s1 == s2
    hVal = {'R' => 0, 'S' => 1, 'P' => 2}
    val1 = hVal[s1]
    val2 = hVal[s2]
    diff = (val1 - val2) % 3
    return player1 if diff.even?
    return player2
  end

  def self.tournament_winner(tournament)
    t1 = tournament[0]
    t2 = tournament[1]
    if t1.class == Array  &&  t1[0].class == Array
      p1 = tournament_winner(t1)
      p2 = tournament_winner(t2)
      return winner(p1, p2)
    else
      return winner(t1, t2)
    end
  end

end


t = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]
#t = [["Armando", "P"], ["Dave", "S"]]
#a = RockPaperScissors.tournament_winner(t)
#print(a)

