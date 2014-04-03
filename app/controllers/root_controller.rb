class RootController < ApplicationController

  def home
    @languages = Language.all
  end

end
