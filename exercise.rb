ballots = [{1 => 'Smudge', 2 => 'Tigger', 3 => 'Simba'},
           {1 => 'Bella', 2 => 'Lucky', 3 => 'Tigger'},
           {1 => 'Bella', 2 => 'Boots', 3 => 'Smudge'},
           {1 =>'Boots', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Lucky', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Smudge', 2 => 'Simba', 3 => 'Felix'}]




#list of names

names = []

ballots.each do |ballot|
  ballot_names = ballot.values
  ballot_names.each do |name|
    names << name
  end
end

names.uniq!
puts names

names_hash = Hash[names.map {|v| [v,0]}]
puts names_hash

# invert = []
# #
# ballots.each do |ballot|
#   reverse = ballot.invert
#   invert << reverse
# end

# puts invert.inspect

def tally(ballots, names)
  names.each { |k, v| names[k] = 0 }
  ballots.each do |ballot|
    ballot.each do |key, value|
      if key ==1
        names[value] += 3
      elsif key ==2
        names[value] += 2
      elsif key ==3
        names[value] += 1
      end
    end
  end
end

tally(ballots, names_hash)
tally(ballots, names_hash)
tally(ballots, names_hash)
tally(ballots, names_hash)
tally(ballots, names_hash)
puts names_hash
results = names_hash.sort_by(&:last).reverse
puts results.inspect
place = 0
results.each do |result|
  place += 1
  puts "#{result[0]} is in place #{place} with #{result[1]} points!"
end
