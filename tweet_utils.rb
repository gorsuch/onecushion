# set of utility methods that allow us to extract useful info from a tweet's text

class String
  # give me all hashtags in a given tweet
  def hashtags
    self.split(" ").reject do |item|
      item[0].chr != '#'
    end
  end
  
  # give me all twitter users in a given tweet
  def users
    self.split(" ").reject do |item|
      item[0].chr != '@'
    end
  end  
end

class Array
  # removes twitter markup (@,#) data from all elements in an array
  def clean
    self.map do |item|
      item.gsub("@","").gsub("#","")
    end
  end
end