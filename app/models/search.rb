class Search < ActiveRecord::Base
  attr_accessible :name, :url
  
  has_many :results
  
  
  def build_craigs_list_url (search_string)
    search_words = search_string.split(' ')
    self.url = "http://columbus.craigslist.org/search/sss?query=" 
    search_words.each_with_index do |word, index|
      self.url << word 
      if index < (search_words.length - 1)
        self.url << '+'
      end
    end
    self.url << "&srchType=A&minAsk=&maxAsk="   
  end
  
  def find_craigs_list_results
     doc = Nokogiri::HTML(open(self.url))
      doc.css(".row"). each do |row|
        result = self.results.create
        result.link = row.at_css("a").text
        result.price = row.at_css(".itempp").text[/[0-9\.]+/]
        result.sold_by = row.at_css(".gc a").text
        result.save
      end
  end
  
  
end
