class ResultController < ApplicationController
  def new
    @results = Result.new
  end

  def index
    
    @results = Reuslt.new
    @result.build_search_url(params[:search])
    @results = Result.find params[:search]
  end
end
