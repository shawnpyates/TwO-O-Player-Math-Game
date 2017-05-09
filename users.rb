class User

    attr_reader :name
    attr_accessor :total_questions, :correct_answers, :lives, :alive
    
    def initialize(name)
        @name = name
        @lives = 3
        @total_questions = 0
        @correct_answers = 0 
    end

    def dead?
        if @lives == 0
            true
        end 
    end
        
end
