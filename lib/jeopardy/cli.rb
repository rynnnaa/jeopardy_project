class CLI

  def start
    self.welcome
    self.main_menu
    # self.display_random_question
  end

  def welcome
    puts "Welcome to Jeopardy Practice!"
    # sleep(1)
    puts "Are you ready to get started?"
    sleep(1)
    puts "Here are the questions:"
    self.display_questions_list
    
  end

  # def main_menu
  #   input = nil
  #   while input != "exit"
  #     puts "Please enter a number from 1-200 to pick a specific question you'd like to learn more about. Type the word random to study a random question, or type exit to end"
  #     self.display_question_info
  #     case input
  #     when"exit"
  #     self.sign_off
  #     when 'random'
  #       self.display_random_question
  #     else
  #       puts "That is an invalid option, please try again."
  #     end
  #   end
  # end

  def main_menu
    input = nil
    while input != "exit"
      puts "Please enter a number from 1-200 to pick a specific question you'd like to learn more about. Type the word random to study a random question, or type exit to end"
      self.display_question_info
      # puts "-------------------------------------------------------------------------"
      # elsif !self.valid_input?(input)
      #   puts "That is an invalid option, please try again."
      if input == "random"
        self.display_random_question
      else 
        puts "Im sorry that was not valid, please try again"
        self.main_menu
      end
    end
  end



  def display_question_info
    input = gets.to_i
    
    puts "You have chosen the question: #{Jeopardy_class.all[input.to_i-1].question}"
    puts "Answer: #{Jeopardy_class.all[input.to_i-1].answer}"
    puts "Title: #{Jeopardy_class.all[input.to_i-1].title}"
    puts "Airdate: #{Jeopardy_class.all[input.to_i-1].airdate}"
    puts "--------------------------------------------------------------------------------------"
    self.main_menu
  end

  def display_questions_list
    API.get_response
    Jeopardy_class.all.each.with_index(1) do |obj, index|
      puts "#{index}: #{obj.question}"
    end
  end

  def display_random_question
    puts "***************************You have chosen a random question***************************"
    API.get_random
    Jeopardy_class.all.each.with_index(1) do |obj, index|
      puts "#{index}: #{obj.question}"
    end
  end

  # def valid_input?(input)
  #   input.to_i.between?(1, 200) || input == "exit" || input == "random"
  # end

  def sign_off
    puts "Thanks for playing Jeopardy Practice! We wish you all the best! GOOD LUCK!"
  end
end