class LanguagesController < ApplicationController

  def show
    @language = Language.find_by_slug(params[:language]) || not_found
    @newLink = Link.new
  end

end
