class LinksController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @languages = Language.all
  end

  def create
    @link = current_user.links.build(link_params)
    @language = Language.find(link_params['language'].to_i)

    if @link.save

      Tag.create do |t|
        t.link_id = @link.id
        t.language_id = @language.id
      end

      redirect_to language_path(@language)
    else
      flash[:error] = @link.errors.full_messages.join(", ")
      render '/languages/show'
    end

  end

  private

  def link_params
    params.require(:link).permit(:url, :description, :title, :level, :free, :language)
  end

end
