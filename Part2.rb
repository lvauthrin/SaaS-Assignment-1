class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  strategyMappings = { "R" => "S", "S" => "P", "P" => "R" }
  firstStrategy = game[0][1]
  secondStrategy = game[1][1]
  raise NoSuchStrategyError unless strategyMappings.keys.include?(firstStrategy) or strategyMappings.keys.include?(secondStrategy)
  return game[firstStrategy.eql?(secondStrategy) or strategyMappings[firstStrategy].eql?(secondStrategy) ? 0 : 1]
end

puts rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ]) 

def rps_tournament_winner(tournament)
  runningTournament = tournament
  while (runningTournament.length > 1) 
    runningTournament.map(|
  end
  return runningTournament[0]
end

rps_tournament_winner([
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"],  ["Michael", "S"] ],
],
[ 
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
])
