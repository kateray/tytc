class LanguagesController < ApplicationController

  def show
    @language = Language.find_by_slug(params[:language]) || not_found
  end

end
