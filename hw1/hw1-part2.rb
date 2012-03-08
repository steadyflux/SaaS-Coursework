class WrongNumberOfPlayersError < StandardError ; end 
class NoSuchStrategyError < StandardError ; end

class RPSEntry
  attr_accessor :name, :strategy
  
  def initialize(entry)
    raise NoSuchStrategyError unless ["R","P","S"].include? entry[1].upcase
    @name = entry[0]
    @strategy = entry[1]
  end
    
  def self.declare_winner(entry1, entry2)
    if entry1.strategy == entry2.strategy 
      return entry1 
    end
    trial = [entry1.strategy, entry2.strategy]
    return entry1 if ["R", "S"] == trial
    return entry1 if ["P", "R"] == trial
    return entry1 if ["S", "P"] == trial
    return entry2 if ["R", "P"] == trial
    return entry2 if ["P", "S"] == trial
    return entry2 if ["S", "R"] == trial
  end
end

def rps_game_winner(game) 
  raise WrongNumberOfPlayersError unless game.length == 2
  entry1 = RPSEntry.new([game[0][0], game[0][1]])
  entry2 = RPSEntry.new([game[1][0], game[1][1]])
  winner = RPSEntry.declare_winner(entry1, entry2)
  [winner.name, winner.strategy]
end

def rps_tournament_winner(tournament)
  if tournament[0][0].is_a?(String)
    rps_game_winner([tournament[0], tournament[1]])
  else
    rps_tournament_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  end
end

# tournament = [[ [["Armando", "P"], ["Dave", "S"] ], [ ["Richard", "R"], ["Michael", "S"]], ], [[ ["Allen", "S"], ["Omer", "P"] ], [ ["David E.", "R"], ["Richard X.", "P"] ]]]
# 
# p rps_tournament_winner(tournament)

# tournament = [
#   [
#     [
#       [ ["a", "P"], ["b", "S"] ],
#       [ ["c", "R"], ["d", "S"] ],
#     ],
#     [
#       [ ["e", "S"], ["f", "P"] ],
#       [ ["g", "R"], ["h", "P"] ]
#     ]
#   ],
#   [
#     [
#       [ ["i", "P"], ["j", "S"] ],
#       [ ["k", "R"], ["l", "S"] ],
#     ],
#     [
#       [ ["m", "S"], ["n", "P"] ],
#       [ ["o", "R"], ["p", "P"] ]
#     ]
#   ]
# ]
# 
# p rps_tournament_winner(tournament)