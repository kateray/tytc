class LanguagesController < ApplicationController

  def show
    @language = Language.find_by_slug(params[:language]) || not_found
    @link = Link.new
  end

end
