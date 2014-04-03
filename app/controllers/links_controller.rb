class LinksController < ApplicationController
  before_action :authenticate_user!, only: :create

  def show
    @link = Link.find(params[:id])
    @language = @link.tag.language
    render '/languages/show'
  end


  def create
    @link = current_user.links.build(link_params)
    @language = Language.find(link_params['language'].to_i)

    if @link.save

      Tag.create do |t|
        t.link_id = @link.id
        t.language_id = @language.id
      end
      flash[:new_link_id] = @link.id
      redirect_to language_link_path(@link.tag.language, @link)
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
