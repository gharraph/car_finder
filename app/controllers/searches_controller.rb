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
    @craigs_list_search.displayable = true
    @craigs_list_search.save
    @craigs_list_search.find_craigs_list_results
    
    
    #more sites can be scraped for the same search
    #@angel_list_search = Search.new
    #@angel_list_search.build_angel_list_url(param[:search])
    #@angel_list_search.name = "Angel List"
    #@angel_list_search.Save
    #@angel_list_search.find_angel_list_results
    
    redirect_to searches_path
  end
  
  def index
    @searches = Search.all
  end
end
