DOORS_NUMBER = 3
NUMBER_OF_GAMES = 100000

def put_prize
  doors = Array.new(DOORS_NUMBER, false)
  prize = Random.new.rand(0...DOORS_NUMBER)
  doors[prize] = true
  doors
end

def make_choice
  Random.new.rand(0...DOORS_NUMBER)
end

number_of_wins_no_monty = 0
number_of_wins_with_monty = 0

NUMBER_OF_GAMES.times do
  prizes = put_prize
  choice = make_choice
  number_of_wins_no_monty += 1 if prizes[choice]
  monty_door = prizes.index.with_index { |prize, index| !prize && index != choice }
  changed_choice = (0...DOORS_NUMBER).to_a.detect { |index| index != choice && index != monty_door }
  number_of_wins_with_monty += 1 if prizes[changed_choice]
end

p put_prize
p make_choice
p 100.0 * number_of_wins_no_monty / NUMBER_OF_GAMES
p 100.0 * number_of_wins_with_monty / NUMBER_OF_GAMES

possible_prizes = (0...DOORS_NUMBER).to_a
possible_choices = (0...DOORS_NUMBER).to_a
number_of_wins_no_monty = 0
number_of_wins_with_monty = 0

possible_prizes.each do |prize|
  possible_choices.each do |choice|
    if prize == choice
      number_of_wins_no_monty += 1
    else
      number_of_wins_with_monty += 1
    end
  end
end

p number_of_wins_no_monty
p number_of_wins_with_monty

# [+] [ ] [ ]
#  ^   m
#      ^   m
#      m   ^
# [ ] [+] [ ]
#  ^       m
#  m   ^
#  m       ^
# [ ] [ ] [+]
#  ^   m
#  m   ^
#  m       ^

# [?] [?] [?] [?] [?]
#  ^

# (1)/5 < (4/3)/5
# 1/5 < 4/5
