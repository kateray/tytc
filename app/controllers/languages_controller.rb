class LanguagesController < ApplicationController

  def show
    @language = Language.find_by_slug(params[:language])
    @link = Link.new
  end

end
