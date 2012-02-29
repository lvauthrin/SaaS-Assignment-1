class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)  
  raise WrongNumberOfPlayersError unless game.length == 2
  strategyMappings = { "R" => "S", "S" => "P", "P" => "R" }
  game.each{ |player| raise NoSuchStrategyError unless strategyMappings.keys.include?(player[1]) }  
  game.sort { |a, b| 
    if a[1] == b[1]
      comp = 0
    elsif strategyMappings[a[1]] == b[1]
      comp = -1
    else
      comp = 1
    end 
  }[0]
end

#puts rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ]).to_s

def rps_tournament_winner(tournament)
  runningTournament = tournament.flatten(1)
  while runningTournament.length > 1 
    runningTournament = runningTournament.map { |game| puts game.to_s; rps_game_winner(game) }
  end
  return runningTournament[0]
end

puts rps_tournament_winner([
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"],  ["Michael", "S"] ],
],
[ 
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
])