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
  
  def to_html
    self.gsub(/(http:\/\/\S*)/) do |s|
      "<a href='#{$1}'>#{$1}</a>"
    end.gsub(/@(\w*)/) do |s|
      "<a href='http://twitter.com/#{$1}'>@#{$1}</a>"
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