class CLI

  def start
    self.welcome
    self.main_menu
  end

  def welcome
    puts "********************Welcome to Jeopardy Practice!*************************"
    sleep(1)
    puts "********************Are you ready to get started?*************************"
    sleep(1)
    puts "****************************Let's Practice!*************************"
    sleep(2)
  end

  def main_menu
    input = nil
    while input != "exit"
      puts "Type the word question to learn more on jeopardy questions. Type the word random to study a random question, or type exit to end"
      puts "-------------------------------------------------------------------------"
      input = gets.strip.downcase
      if input == "random"
        self.display_random_question
      elsif input == "question"
        self.display_questions_list
        self.display_question_info
      elsif input == "exit"
        self.sign_off
      else
        puts "That is an invalid option. Please try again."
      end
    end
  end



  def display_question_info
    puts "Please enter a number from 1-200 to pick a specific question you'd like to learn more about."
    input = gets.to_i
    
    puts "You have chosen the question: #{Jeopardy_class.all[input.to_i-1].question}"
    puts "Answer: #{Jeopardy_class.all[input.to_i-1].answer}"
    puts "Title: #{Jeopardy_class.all[input.to_i-1].title}"
    puts "Airdate: #{Jeopardy_class.all[input.to_i-1].airdate}"
    puts "--------------------------------------------------------------------------------------"
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

  def sign_off
    puts "Thanks for playing Jeopardy Practice! We wish you all the best! GOOD LUCK!"
  end
end