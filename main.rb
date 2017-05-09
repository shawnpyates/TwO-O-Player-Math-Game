require './questions'
# require './turns'
require './users'


def play_turn(user)
    q = Question.new 
    puts "#{user.name}: What is #{q.first_number} + #{q.second_number}?"
    user_answer = gets.chomp.to_i
    user.total_questions += 1
    correct_answer = q.get_answer
    if user_answer == correct_answer
        user.correct_answers += 1
        puts "#{user.name}: That is CORRECT!"
    else 
        user.lives -= 1
        puts "#{user.name}: That is INCORRECT!"
    end
end


def game_flow
    user_1 = User.new("Player 1")
    user_2 = User.new("Player 2")
    counter = 0
    while user_1.lives > 0 && user_2.lives > 0
        puts "----- NEW TURN -----"
        counter.even? ? play_turn(user_1) : play_turn(user_2)
        output_string = "P1: #{user_1.correct_answers}/#{user_1.total_questions} vs "
        output_string += "P2: #{user_2.correct_answers}/#{user_2.total_questions}"
        puts output_string
        counter += 1
    end
    winner = user_1.dead? ? user_2 : user_1 
    puts "---------------------------------"
    puts "#{winner.name} wins with a score of #{winner.correct_answers}/#{winner.total_questions}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
end

game_flow


    