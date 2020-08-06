class API
  def self.get_response
    response = HTTParty.get('http://jservice.io/api/clues')
    response.map do |hash|
      Jeopardy_class.new(hash['question'], hash['idx'], hash['answer'], hash['title'], hash['airdate'])
    end
  end

  def self.get_random
    response = HTTParty.get('http://jservice.io/api/random')
    response.map do |hash|
      Jeopardy_class.new(hash['question'], hash['idx'], hash['answer'], hash['title'], hash['airdate'])
    end
  end
end