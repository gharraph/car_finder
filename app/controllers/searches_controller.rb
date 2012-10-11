class SearchesController < ApplicationController
  def new
    @search = Search.new
  end
  
  def create
    @craigs_list_search = Search.new
    
    @craigs_list_search.build_craigs_list_url(params[:search][:url])
    @craigs_list_search.name = "Graigs List"
    @craigs_list_search.save
    redirect_to searches_path
    
    #@angel_list_search.build_angel_list_url(param[:search])
    #@angel_list_search.name = "Angel List"
    #@angel_list_search.Save
    
  end
  
  def index
    @searches = Search.all
  end
end
