require "pry"

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>  [{
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }]
    }
  }
end



def num_points_scored(players_name)
  player_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          player_info.each do |name, details|
            if name == players_name
              player_points = details[:points]
            end 
          end
        end
      end
    end 
  end
  player_points
end


def shoe_size(players_name)
  size = 0 
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          player_info.each do |name, details|
            if name == players_name
              size = details[:shoe]
            end 
          end
        end
      end
    end 
  end
  size
end


def team_colors(team_name)
  result = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        result = team_data[:colors]
      end 
    end 
  end 
  result
end


def team_names
  teams = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        teams << data
      end
    end
  end
  teams
end


def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          player_info.each do |name, details|
            if team_data[:team_name] == team_name
              jersey_numbers << details[:number]
            end 
          end
        end
      end
    end 
  end
  jersey_numbers
end


def player_stats(players_name)
  hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          player_info.each do |name, details|
            if name == players_name
              hash = details
            end 
          end
        end
      end
    end 
  end
  hash
end


def big_shoe_rebounds
  shoe_sizes = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          player_info.each do |name, details|
              shoe_sizes[name] = details[:shoe]
          end
        end
      end
    end 
  end
  shoe_sizes
  largest = shoe_sizes.key(shoe_sizes.values.max)
  num = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          player_info.each do |name, details|
            if name == largest
              num = details[:rebounds]
            end
          end 
        end 
      end 
    end 
  end 
  num
end


def most_points_scored 
  most = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          player_info.each do |name, details|
              most[name] = details[:points]
          end
        end
      end
    end 
  end
  most
  player_w_most = most.key(most.values.max)
end


def winning_team
  scores = {}
  team_points_1 = []
  team_points_2 = []
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          player_info.each do |name, details|
            if team_points_1.length < 5
              team_points_1 << details[:points]
            else
              team_points_2 << details[:points]
            end 
          end
        end
      end
    end
  end 
  game_hash.each do |location, team_data|
    team = team_data[:team_name]
      if !scores.include?(team)
        scores[team] = team_points_1.sum
      else 
        scores[team] = team_points_2.sum
      end
  end
  scores
  winners = scores.key(scores.values.max)
end


def player_with_longest_name
  names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          player_info.each do |name, details|
            names << name 
          end 
        end 
      end 
    end 
  end
  names
  names_by_length = names.max_by { |each_name| each_name.length }
end


def long_name_steals_a_ton?
  steals = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          player_info.each do |name, details|
            steals << details[:steals] 
          end 
        end 
      end 
    end 
  end
  steals
  most_steals = steals.max   #(most_steals = 22)
  
  player_with_longest_name_steals = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          player_info.each do |name, details|
            if name == player_with_longest_name
              player_with_longest_name_steals = details[:steals]
            end 
          end 
        end 
      end 
    end 
  end 
  player_with_longest_name_steals == most_steals
end
