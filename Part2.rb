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

def rps_tournament_winner_inner(tournament)
  tournament.map! do |g|
    begin
      if g.kind_of?(Array)
        rps_game_winner(g)
      else
        g
      end
    rescue
      rps_tournament_winner_inner(g)
    end
  end
end

def rps_tournament_winner(tournament)
  (Math.log(tournament.flatten.length / 2, 2)).to_i.times { rps_tournament_winner_inner(tournament) }
  rps_game_winner(tournament)
end

# puts rps_tournament_winner(
# [
 # [
  # [
   # [ ["Armando", "P"], ["Dave", "S"] ],
   # [ ["Richard", "R"],  ["Michael", "S"] ],
  # ],
  # [ 
   # [ ["Allen", "S"], ["Omer", "P"] ],
   # [ ["David E.", "R"], ["Richard X.", "P"] ]
  # ]
 # ],
 # [
  # [
   # [ ["Armando", "P"], ["Dave", "S"] ],
   # [ ["Richard", "R"],  ["Michael", "S"] ],
  # ],
  # [ 
   # [ ["Allen", "S"], ["Omer", "P"] ],
   # [ ["David E.", "R"], ["Richard X.", "P"] ]
  # ]
 # ] 
# ]
# )