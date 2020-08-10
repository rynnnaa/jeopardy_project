class Jeopardy_class

  @@all = []
  attr_accessor :id, :answer, :question, :value, :title, :random_question, :airdate


  def initialize(question, id, answer, title, airdate )
    @question = question
    @id = id
    @title = title
    @answer = answer
    @airdate = airdate
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end


end
