old_sync = $stdout.sync
$stdout.sync = true

restart = "y" # Restart Checker
leaderboard = ""
ldb_name = "" # Leaderboard Name
easy_ldb = Array.new # Easy leaderboard
normal_ldb = Array.new # Normal Leaderboard
hard_ldb = Array.new # Hard Leaderboard

while restart == "y"
tries = Array.new # Numbers That Have Already Been Guessed
secret_number = ""

puts "Select difficulty. Type 1 for easy, Type 2 for normal, Type 3 for hard:"
diff = gets.chomp.to_i

case diff
when 1
  secret_number = rand(1..25) # Random Number from 1 to 25
  leaderboard = easy_ldb
  ldb_name = "Easy Leaderboard:"
when 2
  secret_number = rand(1..50) # Random Number from 1 to 50
  leaderboard = normal_ldb
  ldb_name = "Normal Leaderboard:"
when 3
  secret_number = rand(1..100) # Random Number from 1 to 100
  leaderboard = hard_ldb
  ldb_name = "Hard Leaderboard:"
else
  puts "Not applicable. Game ending."
  break
end

puts "What is your name?"
name = gets.chomp.to_s # Name for Leaderboard

chances = 0 # Resets number of guessing chances to 0
guess = ""

  while guess != secret_number
        puts "Enter a guess:"
        guess = gets.chomp.to_i
        if guess > secret_number
          puts "Too high"
        elsif guess < secret_number
          puts "Too low"
        elsif guess == secret_number
            chances += 1 # Makes sure current guess is counted as a guess
            puts "You win"

            leaderboard << [name, chances]
            leaderboard = leaderboard.sort_by{|name, chances| chances}
            puts "#{ldb_name}"

            leaderboard.each{|name, chances|
            puts "#{name} : #{chances}"
            }

            puts "Play again? y/n"
            restart = gets.chomp.to_s
            chances += 10 # Bypasses the if chances == 6 statement below
        end

        if guess != secret_number
          tries << guess
          chances += 1
        end

        if chances == 6
          puts "Failed"
          puts "The secret number is #{secret_number}"
          puts "You tried #{tries}"
          puts "Play again? y/n"
          restart = gets.chomp.to_s
          guess = secret_number # Stops the while guess != secret_number loop above
        end
  end
end
