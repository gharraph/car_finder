require 'nokogiri'
require 'open-uri'

class SearchesController < ApplicationController
  def new
    @search = Search.new
  end
  
  def create
    @craigs_list_search = Search.new
    
    @craigs_list_search.build_craigs_list_url(params[:search][:url])
    @craigs_list_search.name = "Graigs List"
    @craigs_list_search.save
    
    doc = Nokogiri::HTML(open(@craigs_list_search.url))
    doc.css(".row"). each do |row|
      result = @craigs_list_search.results.create
      result.link = row.at_css("a").text
      result.price = row.at_css(".itempp").text[/\$[0-9\.]+/]
      result.sold_by = row.at_css(".gc a").text
      result.save
    end
    
    
    redirect_to searches_path
    
    #@angel_list_search.build_angel_list_url(param[:search])
    #@angel_list_search.name = "Angel List"
    #@angel_list_search.Save
    
  end
  
  def index
    @searches = Search.all
  end
end
