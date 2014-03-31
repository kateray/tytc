class LanguagesController < ApplicationController

  def show
    @language = Language.find(params[:language])
    @link = Link.new
  end

end
