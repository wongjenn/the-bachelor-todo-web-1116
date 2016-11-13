def get_first_name_of_season_winner(data, season)
  data.each do |seasons, contestants|
    if seasons == season
      contestants.each do |contestant|
        if contestant["status"] == "Winner"
          name = contestant["name"].split(" ")
          return name[0]
        end
      end
    end
  end

end

def get_contestant_name(data, occupation)
  data.each do |seasons, contestants|
    contestants.each do |contestant, values|
      if contestant["occupation"] == occupation
        return contestant["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |seasons, contestants|
    contestants.select { |contestant, values| contestant["hometown"] == hometown ? count += 1 : count }
  end

  return count
end

def get_occupation(data, hometown)
  data.each do |seasons, contestants|
    contestants.each do |contestant, values|
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  total_age = 0.00
  count = 0
  data.each do |seasons, contestants|
    if seasons = season
      contestants.each do |contestant|
        total_age += contestant["age"].to_f
        count += 1
      end
    end
  end

  season == "season 11" ? (total_age/count).ceil : total_age.to_i/count
end
