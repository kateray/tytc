class RootController < ApplicationController

  def home
    @languages = Language.all.order('links_count DESC')
  end

end
