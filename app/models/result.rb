class Result < ActiveRecord::Base
  attr_accessible :link, :price, :sold_by
  belongs_to :search
  
end
